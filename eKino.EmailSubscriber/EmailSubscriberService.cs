using EasyNetQ;
using System.Net.Mail;
using System.Net;
using System.Net.Mime;
using Microsoft.Extensions.Options;
using eKino.EmailSubscriber.Utils;
using RabbitMQ.Client;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
using Microsoft.ML;
using eKino.Model;

namespace eKino.EmailSubscriber
{
    public class EmailSubscriberService : BackgroundService
    {
        private readonly ILogger<EmailSubscriberService> logger;
        private readonly MailSMTP mailSMTPSettings;

        private readonly string _host = Environment.GetEnvironmentVariable("RABBITMQ_HOST") ?? "localhost";
        private readonly string _username = Environment.GetEnvironmentVariable("RABBITMQ_USERNAME") ?? "guest";
        private readonly string _password = Environment.GetEnvironmentVariable("RABBITMQ_PASSWORD") ?? "guest";
        private readonly string _virtualhost = Environment.GetEnvironmentVariable("RABBITMQ_VIRTUALHOST") ?? "/";

        public EmailSubscriberService(ILogger<EmailSubscriberService> logger, IOptions<MailSMTP> mailSMTPSetting, IConfiguration configuration)
        {
            this.logger = logger;
            this.mailSMTPSettings = mailSMTPSetting.Value;
        }
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    using (var bus = RabbitHutch.CreateBus($"host={_host};virtualHost={_virtualhost};username={_username};password={_password}"))
                    {
                        bus.PubSub.Subscribe<eKino.Model.EmailMessage>("email-queue", emailMessage =>
                        {
                            SendMailAsync(emailMessage);
                        });
                        Console.WriteLine("Listening for email messages.");
                        await Task.Delay(TimeSpan.FromSeconds(5), stoppingToken);
                    }
                }
                catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
                {
                    break;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }

        }
        private void RabbitMQ_ConnectionShutdown(object sender, ShutdownEventArgs e) { }
        public Task SendMailAsync(eKino.Model.EmailMessage emailMessage)
        {

            string from = mailSMTPSettings.From;
            string password = mailSMTPSettings.Password;
            string host = mailSMTPSettings.Host;
            string to = mailSMTPSettings.To;
            string subject = emailMessage.Subject;
            string body = $"{emailMessage.Body}\n\n\nVaš unikatni kod za pristup projekciji: QKtoz-{emailMessage.ReservationId}\nBroj rezerviranih karti: {emailMessage.NumTickets}";

            var client = new SmtpClient(host)
            {
                Port = 587,
                Credentials = new NetworkCredential(from, password),
                EnableSsl = true
            };

            var message = new MailMessage(from, to, subject, body);

            try
            {
                client.Send(message);
                logger.LogInformation($"Email sent");
            }
            catch (Exception ex)
            {
                logger.LogInformation("Failed to send email: " + ex.Message);
            }

            return Task.CompletedTask;
        }

        public override void Dispose()
        {
            base.Dispose();
        }

    }
}

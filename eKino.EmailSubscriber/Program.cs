using Microsoft.Extensions.Hosting;
using eKino.EmailSubscriber;
using eKino.EmailSubscriber.Utils;
using Microsoft.Extensions.DependencyInjection;

IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices((hostContext, services) =>
    {
        services.Configure<MailSMTP>(hostContext.Configuration.GetSection("MailSMTP"));

        services.AddHostedService<EmailSubscriberService>(); 
    })
    .Build();

await host.RunAsync();
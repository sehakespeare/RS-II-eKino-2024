using AutoMapper;
using eKino.Model;
using eKino.Services.Database;
using eKino.Services.Interfaces;
using System;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EasyNetQ;
using Microsoft.Extensions.Configuration;

namespace eKino.Services.Implementations
{
    public class EmailProviderService : IEmailProviderService
    {

        private readonly IBus bus;

        public EmailProviderService(IConfiguration configuration)
        {
            var rabbitMQHost = configuration["RABBITMQ_HOST"] ?? "localhost";
            var rabbitMQUsername = configuration["RABBITMQ_USERNAME"] ?? "guest";
            var rabbitMQPassword = configuration["RABBITMQ_PASSWORD"] ?? "guest";
            var rabbitMQVirtualHost = configuration["RABBITMQ_VIRTUALHOST"] ?? "/";

            var rabbitMQConnectionString = $"host={rabbitMQHost};username={rabbitMQUsername};password={rabbitMQPassword};virtualHost={rabbitMQVirtualHost}";

            this.bus = RabbitHutch.CreateBus(rabbitMQConnectionString);
        }

        public void SendMessage(EmailMessage emailMessage, string topic)
        {
            bus.PubSub.Publish(emailMessage, topic); 
        }

    }
}

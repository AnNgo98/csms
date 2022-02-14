﻿using System;
using System.Linq;
using Microsoft.Extensions.Configuration;

namespace SystemApi.Framework.Configuration
{
    public static class ConfigurationExtensions
    {
        public static string GetDbConnectionString(this IConfiguration configuration, string enviroment)
        {
            if (configuration == null)
            {
                throw new ArgumentNullException(nameof(configuration));
            }

            if (enviroment == "Development")
            {
                return configuration["ConnectionStrings:DevConnection"];
            }

            return configuration["ConnectionStrings:DbConnection"];
        }

        public static string[] GetAllowOrigins(this IConfiguration configuration)
        {
            if (configuration == null)
            {
                throw new ArgumentNullException(nameof(configuration));
            }

            return configuration["Auth:AllowOrigins"].Split(',').Select(val => val.Trim()).ToArray();
        }
    }
}

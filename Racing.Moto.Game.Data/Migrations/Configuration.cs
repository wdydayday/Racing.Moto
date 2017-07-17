namespace Racing.Moto.Game.Data.Migrations
{
    using Entities;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Racing.Moto.Game.Data.RacingGameDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(Racing.Moto.Game.Data.RacingGameDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //

            // config
            context.AppConfig.AddOrUpdate(
              p => p.Name,
              new AppConfig { Name = "Racing_Opening_Seconds", Value = (60 * 8).ToString() },// ����ʱ��, �����¼, Ĭ��8m
              new AppConfig { Name = "Racing_Close_Seconds", Value = (60 * 1).ToString() }, // ����ʱ��, �����¼, Ĭ��1m
              new AppConfig { Name = "Racing_Game_Seconds", Value = "50" },// ����ʱ��, �����¼, 50s
              new AppConfig { Name = "Racing_Lottery_Seconds", Value = "10" }// ����ʱ��, �����¼, 10s
            );
        }
    }
}
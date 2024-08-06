using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Databaselayer.Migration
{
    internal sealed class Configuration : DbMigrationsConfiguration<Databaselayer.MyDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;

            AutomaticMigrationDataLossAllowed = true;

            ContextKey = "Database_Layer.MyDbContext";
        }

        protected override void Seed(Databaselayer.MyDbContext context)
        {
            //  This method will be called after migrating to the latest version. 

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. 
        }
    }
}

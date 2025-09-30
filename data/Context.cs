using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Tracker.Models;

namespace Tracker.data
{
    public class Context : DbContext
    {

        public Context() : base("name=MyConnectionString") { }
        public DbSet<users> Users { get; set; }
    }
}
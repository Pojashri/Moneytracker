using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Tracker.Models
{
    public class users
    {
        [Key]
        public int userid { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public int PasswordHash { get; set; }
        public string email { get; set; }
    }
}
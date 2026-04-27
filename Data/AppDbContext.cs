using Microsoft.EntityFrameworkCore;
//import models/entities
using TravelSave.Models;
//import identity for user management
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;


namespace TravelSave.Data
{
    //AppDbContext class inheriting from IdentityDbContext to provide all tables needed for identity/user management
    public class AppDbContext : IdentityDbContext<User>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
        public DbSet<Trip> Trips { get; set; }
    }
}

using Microsoft.AspNetCore.Mvc;
using TravelSave.Models;
using TravelSave.Data;

namespace Trips.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public class TripsController : ControllerBase

    {
        private readonly AppDbContext _context;

        public TripsController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Trip>> GetTrips()
        {
            return _context.Trips.ToList();
        }

        [HttpPost]
        public ActionResult<Trip> CreateTrip(Trip trip)
        {
            _context.Trips.Add(trip);
            _context.SaveChanges();
            return CreatedAtAction(nameof(GetTrips), new { id = trip.Id }, trip);
        }
    }
}
using Microsoft.AspNetCore.Identity;

namespace TravelSave.Models
{
    //User class inheriting from IdentityUser for ASP.NET Core Identity integration with default properties {https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.identity.entityframeworkcore.identityuser?view=aspnetcore-1.1}
    public class User : IdentityUser
    {
        // Additional properties can be added here as needed, e.g., FirstName, LastName, etc.
    }
}
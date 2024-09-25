using GymMe.Models;
using GymMe.Modules;
using System;

public class SupplementController
{
    public static Response<MsSupplement> DeleteSupplement(int id)
    {
        try
        {
            using (var db = new YourDbContext())
            {
                var supplement = db.MsSupplements.Find(id);
                if (supplement == null)
                {
                    return new Response<MsSupplement>
                    {
                        Success = false,
                        Message = "Supplement not found"
                    };
                }

                db.MsSupplements.Remove(supplement);
                db.SaveChanges();

                return new Response<MsSupplement>
                {
                    Success = true,
                    Message = "Supplement deleted successfully",
                    Data = supplement
                };
            }
        }
        catch (Exception ex)
        {
            return new Response<MsSupplement>
            {
                Success = false,
                Message = $"Error deleting supplement: {ex.Message}"
            };
        }
    }
}
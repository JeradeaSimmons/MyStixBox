using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using MyStixBox.Models;

namespace MyStixBox.Repositories
{
  public class StixRepository
  {
    private readonly IDbConnection _db;

    public StixRepository(IDbConnection db)
    {
      _db = db;
    }
    internal List<Stix> GetAll()
    {
      string sql = @"
      SELECT
      s.*,
      a.*
       FROM stix s
       JOIN accounts a ON a.id = s.creatorId;
      ";
      return _db.Query<Stix, Profile, Stix>(sql, (stix, profile)=>
      {
        return stix;
      }).ToList();
    }

    internal Stix Create(Stix newStix)
    {
      string sql = @"
      INSERT INTO stix
      (name, company, binder, filler, wrapper, myReview, img, creatorId)
      VALUES
      (@name, @company, @binder, @filler, @wrapper, @myReview, @img, @creatorId);
      SELECT LAST_INSERT_ID();
      ";
      int id = _db.ExecuteScalar<int>(sql, newStix);
      newStix.Id = id;
      return newStix;
    }
  }
}
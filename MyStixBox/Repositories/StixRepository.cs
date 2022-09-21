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
  }
}
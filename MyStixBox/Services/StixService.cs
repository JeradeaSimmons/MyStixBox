using System.Collections.Generic;
using MyStixBox.Models;
using MyStixBox.Repositories;

namespace MyStixBox.Services
{
  public class StixService
  {
    private readonly StixRepository _stixRepo;
    public StixService(StixRepository stixRepo)
    {
      _stixRepo = stixRepo;
    }
    internal List<Stix> GetAll()
    {
      return _stixRepo.GetAll();
    }

    internal Stix Create(Stix newStix)
    {
      return _stixRepo.Create(newStix);
    }
  }
}

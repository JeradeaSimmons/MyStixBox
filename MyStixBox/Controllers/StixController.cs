using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using CodeWorks.Auth0Provider;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MyStixBox.Models;
using MyStixBox.Services;

namespace MyStixBox.Controllers
{
  [ApiController]
    [Route("api/[controller]")]
    public class StixController : ControllerBase
    {
        private readonly StixService _stixService;


public StixController(StixService stixService)
{
    _stixService = stixService;

}

[HttpGet]
public ActionResult<List<StixController>> GetAll()
{
    try 
    {
      List<Stix> stix = _stixService.GetAll();
      return Ok(stix);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
}

[HttpPost]
[Authorize]
public async Task<ActionResult<Stix>> Create([FromBody] Stix newStix) 
{
  try 
  {
    Account user = await HttpContext.GetUserInfoAsync<Account>();
    newStix.CreatorId = user.Id;
    Stix stix = _stixService.Create(newStix);
    stix.Creator = user;
    return Ok(stix);
  }
  catch (Exception e)
  {
    return BadRequest(e.Message);
  }
}


    }
}
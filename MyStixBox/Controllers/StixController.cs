using System;
using System.Collections.Generic;
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

    }
}
package ch.vinnol.rickrollgenerator.controller;

import ch.vinnol.rickrollgenerator.entity.CountryStat;
import ch.vinnol.rickrollgenerator.service.CountryStatService;
import ch.vinnol.rickrollgenerator.service.PrankService;
import org.jboss.resteasy.annotations.jaxrs.PathParam;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/stat")
public class CountryStatController {

    public CountryStatService service = new CountryStatService();

    @POST
    @Path("/{prankId}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public CountryStat setCountryStat(@PathParam String prankId, CountryStat stat){
        return service.newCountryStat(prankId, stat);
    }

    @GET
    @Path("/{prankId}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public List<CountryStat> getCountryStats(@PathParam String prankId){
        return service.getCountryStatsByPrankId(prankId);
    }
}

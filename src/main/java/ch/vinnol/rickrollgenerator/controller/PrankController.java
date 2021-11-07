package ch.vinnol.rickrollgenerator.controller;

import ch.vinnol.rickrollgenerator.entity.CountryStat;
import ch.vinnol.rickrollgenerator.entity.Prank;
import ch.vinnol.rickrollgenerator.service.PrankService;
import org.jboss.resteasy.annotations.jaxrs.PathParam;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.time.LocalDateTime;
import java.util.UUID;

@Path("/prank")
public class PrankController {

    public PrankService service = new PrankService();

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Prank setNewPrank(Prank prank){
        prank.setActive(true);
        prank.setCreateDate(LocalDateTime.now());
        prank.setCount(0);
        prank.setUid(UUID.randomUUID().toString());

        return service.newPrank(prank);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{uid}")
    public Prank getPrank(@PathParam String uid){
        return service.getPrankByUID(uid);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/clicked/{uid}")
    public void clicked(@PathParam String uid){
        service.clicked(uid);
    }
}

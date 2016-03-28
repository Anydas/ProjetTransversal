package Controleur;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class BonjourController {
//Je vous encule ! 
// Et j'assume le fait de vous enculer a sec avec des gravillon

    private String titre = "";
    private String contenu = "";
        
    @RequestMapping(method = RequestMethod.GET)
    public String afficherBonjour(final ModelMap pModel) {
        
       pModel.addAttribute("page", "index");
        return "bonjour";
    }
}
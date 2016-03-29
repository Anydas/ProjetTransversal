package Controleur;

import Modele.Country;
import Modele.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/listepays")
public class RecupererListePaysController {

    @RequestMapping(method = RequestMethod.GET)
    public String afficherPays(ModelMap pModel) {

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        List<Country> listePays = session.createQuery("from Country order by CountryName").list();
        List<Country> abcde = new ArrayList();
        List<Country> fghij = new ArrayList();
        List<Country> klmno = new ArrayList();
        List<Country> pqrst = new ArrayList();
        List<Country> uvwxyz = new ArrayList();

        for (int i = 0; i < listePays.size(); i++) {
            if (listePays.get(i).getCountryName().startsWith("A")) {
                abcde.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("B")) {
                abcde.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("C")) {
                abcde.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("D")) {
                abcde.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("É")) {
                abcde.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("E")) {
                abcde.add(listePays.get(i));
            }
          
            if (listePays.get(i).getCountryName().startsWith("F")) {
                fghij.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("G")) {
                fghij.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("H")) {
                fghij.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("I")) {
                fghij.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("J")) {
                fghij.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("K")) {
                klmno.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("L")) {
                klmno.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("M")) {
                klmno.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("N")) {
                klmno.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("O")) {
                klmno.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("P")) {
                pqrst.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("Q")) {
                pqrst.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("R")) {
                pqrst.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("S")) {
                pqrst.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("T")) {
                pqrst.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("U")) {
                uvwxyz.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("V")) {
                uvwxyz.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("W")) {
                uvwxyz.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("X")) {
                uvwxyz.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("Y")) {
                uvwxyz.add(listePays.get(i));
            }
            if (listePays.get(i).getCountryName().startsWith("Z")) {
                uvwxyz.add(listePays.get(i));
            }
        }

   

        pModel.addAttribute("listePays", listePays);
        pModel.addAttribute("abcde", abcde);
        pModel.addAttribute("fghij", fghij);
        pModel.addAttribute("klmno", klmno);
        pModel.addAttribute("pqrst", pqrst);
        pModel.addAttribute("uvwxyz", uvwxyz);
        pModel.addAttribute("page", "ListePa");
        session.close();

        return "listePays";
    }
}

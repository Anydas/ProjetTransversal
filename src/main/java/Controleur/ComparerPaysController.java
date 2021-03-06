package Controleur;
 
import Modele.Country;
import Modele.HibernateUtil;
import Modele.Indicateur;
import Modele.IndicateurValeur;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class ComparerPaysController {
   
    @RequestMapping(value="/menuComparer", method = RequestMethod.GET)
    public String menuComparerPays(ModelMap pModel) {
       
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();  
        Session session = sessionFactory.openSession();  
        session.beginTransaction();
       
        List<Country> listePays = session.createQuery("FROM Country order by CountryName").list();
        List<Country> listeIndicateurs = session.createQuery("FROM Indicateur order by IndicatorName").list();
       
        pModel.addAttribute("listePays", listePays);
        pModel.addAttribute("listeIndicateurs", listeIndicateurs);
        pModel.addAttribute("page", "menuComparer");
       
        session.close();
       
        return "menuComparerPays";
    }
   
    @RequestMapping(value="/comparer", method = RequestMethod.GET)
    public String comparerPays(HttpServletRequest request, ModelMap pModel) {
       
        String erreur = "Aucune erreur";
       
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();  
        Session session = sessionFactory.openSession();  
        session.beginTransaction();
       
        //Implementer le nombre d'indic et pays dynamiquement + tard
        //Constante de 2 pour tester
        int nbPays = 2;
        int nbIndic = 2;
       
        //Insertion des données basiques
        pModel.addAttribute("page", "menuComparer");
        pModel.addAttribute("nbPays", nbPays);
        pModel.addAttribute("nbIndic", nbIndic);
        
        //Insertion des pays
        List<Country> listePays = new ArrayList();
        for (int i = 0 ; i < nbPays ; i++) {
            
            String cName = request.getParameter("pays"+(i+1));
             pModel.addAttribute("pays"+(i+1), cName);
            //On créer un pays à partir seulement de son nom et on récupère le reste des infos pour les besoins
            //de la vue
            Country c = new Country(cName,
                                    (String) session.createQuery("SELECT E.CountryCode FROM Country E WHERE E.CountryName='"+cName+"'").list().get(0),
                                    (String) session.createQuery("SELECT E.Region FROM Country E WHERE E.CountryName='"+cName+"'").list().get(0),
                                    (String) session.createQuery("SELECT E.Income_Group FROM Country E WHERE E.CountryName='"+cName+"'").list().get(0),
                                    (double) session.createQuery("SELECT E.PIB FROM Country E WHERE E.CountryName='"+cName+"'").list().get(0),
                                    (double) session.createQuery("SELECT E.IDH FROM Country E WHERE E.CountryName='"+cName+"'").list().get(0),
                                    (double) session.createQuery("SELECT E.Superficie FROM Country E WHERE E.CountryName='"+cName+"'").list().get(0),
                                    (int) session.createQuery("SELECT E.Population FROM Country E WHERE E.CountryName='"+cName+"'").list().get(0));
            
            listePays.add(c);
        }
        //On retourne une liste avec seulement les pays à comparer
        pModel.addAttribute("Pays", listePays);
       
        //Insertion des indicateurs
        //Exactement la même chose que pour la liste des pays
        //On récupère la liste des indicateurs pour les besoins de la comparaison
        List<Indicateur> listeIndicateurs = new ArrayList();
        for (int i = 0 ; i < nbIndic ; i++) {
            
            String iName = request.getParameter("indicateur"+(i+1));
            pModel.addAttribute("indic"+(i+1), iName);
            
            Indicateur indic = new Indicateur((String) session.createQuery("SELECT E.IndicatorCode FROM Indicateur E WHERE E.IndicatorName='"+iName+"'").list().get(0),
                                              iName,
                                              (String) session.createQuery("SELECT E.Source_note FROM Indicateur E WHERE E.IndicatorName='"+iName+"'").list().get(0),
                                              (String) session.createQuery("SELECT E.Source_Organization FROM Indicateur E WHERE E.IndicatorName='"+iName+"'").list().get(0),
                                              (String) session.createQuery("SELECT E.Theme FROM Indicateur E WHERE E.IndicatorName='"+iName+"'").list().get(0));
            
            listeIndicateurs.add(indic);
        }
       
        pModel.addAttribute("Indicateurs", listeIndicateurs);
        
        //Insertion des valeurs, là c'est un poil plus compliqué
        List<IndicateurValeur> listeValeurs1 = new ArrayList();
        //Double for : Chaque Valeurs est liée à un code indicateur ET un code pays
        List<IndicateurValeur> listeValeurs2= new ArrayList();
       
            for (int j = 0 ; j < nbIndic ; j++) {
                //On récupère les deux codes
                String paysCode = listePays.get(0).getCountryCode();
                String indicCode = listeIndicateurs.get(j).getIndicatorCode();
               
                //On récupère la ou les valeurs liées aux codes ci dessus
                Query req = session.createQuery("SELECT E.Valeur FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')");
               
                //On s'assure qu'il y est au moin une valeur à afficher sinon erreur exception sur la vue
                if (req.list().isEmpty()) {
                    erreur = "Attention, certains indicateurs n'ont pas de valeurs";
                } else {
                    //Si il y a au moin une valeur liée aux deux codes :
                    int nbVal = req.list().size();
                    //On crée un objet IndicateurValeur par valeur
                    for (int k = 0 ; k < nbVal ; k++) {
                       
                        IndicateurValeur val = new IndicateurValeur((int) session.createQuery("SELECT E.Id FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k),
                                                                   (String) session.createQuery("SELECT E.CountryName FROM Country E WHERE E.CountryCode='"+paysCode+"'").list().get(0),
                                                                    (String) session.createQuery("SELECT E.IndicatorName  FROM Indicateur E WHERE E.IndicatorCode='"+indicCode+"'").list().get(0),
                                                                    (int) session.createQuery("SELECT E.Date FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k),
                                                                    (double) session.createQuery("SELECT E.Valeur FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k),
                                                                    (int) session.createQuery("SELECT E.Nbrefoisrecherche FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k));
                       
                        listeValeurs1.add(val);
                    }
                }
            }
            for (int j = 0 ; j < nbIndic ; j++) {
                //On récupère les deux codes
                String paysCode = listePays.get(1).getCountryCode();
                String indicCode = listeIndicateurs.get(j).getIndicatorCode();
               
                //On récupère la ou les valeurs liées aux codes ci dessus
                Query req = session.createQuery("SELECT E.Valeur FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')");
               
                //On s'assure qu'il y est au moin une valeur à afficher sinon erreur exception sur la vue
                if (req.list().isEmpty()) {
                    erreur = "Attention, certains indicateurs n'ont pas de valeurs";
                } else {
                    //Si il y a au moin une valeur liée aux deux codes :
                    int nbVal = req.list().size();
                    //On crée un objet IndicateurValeur par valeur
                    for (int k = 0 ; k < nbVal ; k++) {
                       
                        IndicateurValeur val = new IndicateurValeur((int) session.createQuery("SELECT E.Id FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k),
                                                                   (String) session.createQuery("SELECT E.CountryName FROM Country E WHERE E.CountryCode='"+paysCode+"'").list().get(0),
                                                                    (String) session.createQuery("SELECT E.IndicatorName  FROM Indicateur E WHERE E.IndicatorCode='"+indicCode+"'").list().get(0),
                                                                    (int) session.createQuery("SELECT E.Date FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k),
                                                                    (double) session.createQuery("SELECT E.Valeur FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k),
                                                                    (int) session.createQuery("SELECT E.Nbrefoisrecherche FROM IndicateurValeur E WHERE (E.CountryCode='"+paysCode+"') AND (E.IndicatorCode='"+indicCode+"')").list().get(k));
                       
                        listeValeurs2.add(val);
                    }
                }
            }
            int compteur = 0;
            List<IndicateurValeur> listeValeurs2triee = new ArrayList();
            while(!listeValeurs2.isEmpty()){
                for (int i =0; i <listeValeurs2.size();i++){
                    for(int j=0;j<listeValeurs2.size();j++){
                        if(listeValeurs2.get(i).getDate()>listeValeurs2.get(j).getDate()) {
                            compteur++;
                        }
                    }
                    if(compteur==0){
                        listeValeurs2triee.add(listeValeurs2.get(i));
                        listeValeurs2.remove(i);
                    }
                    compteur=0;
                }
            }
            
        compteur = 0;
            List<IndicateurValeur> listeValeurstriee = new ArrayList();
            while(!listeValeurs1.isEmpty()){
                for (int i =0; i <listeValeurs1.size();i++){
                    for(int j=0;j<listeValeurs1.size();j++){
                        if(listeValeurs1.get(i).getDate()>listeValeurs1.get(j).getDate()) {
                            compteur++;
                        }
                    }
                    if(compteur==0){
                        listeValeurstriee.add(listeValeurs1.get(i));
                        listeValeurs1.remove(i);
                    }
                    compteur=0;
                }
            }
        //On envoi le tout au pModel
        List<Country> listePay = session.createQuery("FROM Country order by CountryName").list();
        List<Country> listeIndicateur = session.createQuery("FROM Indicateur order by IndicatorName").list();
       
        
        pModel.addAttribute("ListeValeurs1",listeValeurstriee );
        pModel.addAttribute("ListeValeurs2", listeValeurs2triee);
        pModel.addAttribute("listePays", listePay);
        pModel.addAttribute("listeIndicateurs", listeIndicateur);
        pModel.addAttribute("Valeurs1", listeValeurstriee);
        pModel.addAttribute("Valeurs2", listeValeurs2triee);
        pModel.addAttribute("page", "menuComparer");
        pModel.addAttribute("errorCode", erreur);
        session.close();
       
        return "comparerPays";
    }
    
    @RequestMapping(value="/histogramme", method = RequestMethod.GET)
    public void afficherGraphiqueHistogramme(final ModelMap pModel, HttpServletRequest request, HttpServletResponse response) throws IOException{

        String pays1 = request.getParameter("pays1");
        String pays2 = request.getParameter("pays2");
        double val1pays1 = Double.parseDouble(request.getParameter("val1pays1"));
        double val2pays1 = Double.parseDouble(request.getParameter("val2pays1"));
        double val1pays2 = Double.parseDouble(request.getParameter("val1pays2"));
        double val2pays2 = Double.parseDouble(request.getParameter("val2pays2"));
        String indicateur1 = request.getParameter("indic1");
        String indicateur2 = request.getParameter("indic2");

        System.out.println(pays1);
        System.out.println(pays2);
        System.out.println(val2pays2);
        System.out.println(val1pays2);
        System.out.println(val2pays1);
        System.out.println(val1pays1);

        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        dataset.addValue(val1pays1, pays1, "Indicateur1");
        dataset.addValue(val2pays1, pays1, "Indicateur2");

        dataset.addValue(val1pays2, pays2, "Indicateur1");
        dataset.addValue(val1pays2, pays2, "Indicateur2");

        JFreeChart barChart = ChartFactory.createBarChart(
                "Graphique de comparaison",
                "Indicateur", "Valeur",
                dataset, PlotOrientation.VERTICAL,
                true, true, false);

        int width = 1200;
        /* Width of the image */
        int height = 800;
        /* Height of the image */


        OutputStream out = response.getOutputStream();
        response.setContentType("image/png");
        ChartUtilities.writeChartAsPNG(out, barChart, width, height);

    }
}
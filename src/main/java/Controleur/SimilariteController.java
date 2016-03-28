/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleur;

import Modele.Country;
import Modele.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Maxence
 */
@Controller
public class SimilariteController {
    
@RequestMapping(value="/menuSimilarite", method = RequestMethod.GET)
    public String menuSimilarite(ModelMap pModel) {
        //envoie les pays et les indicateurs 
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();  
        Session session = sessionFactory.openSession();  
        session.beginTransaction();
        
        List<Country> listePays = session.createQuery("FROM Country E").list();
        List<Country> listeIndicateurs = session.createQuery("FROM Indicateur E").list();
        
        pModel.addAttribute("listePays", listePays);
        pModel.addAttribute("listeIndicateurs", listeIndicateurs);
        
        session.close();
                       
        return "menuSimilarite";
    }
    
    // Renvoie un tableau avec les valeurs de similarité ! DITES SI VOUS VOULEZ UN TABLEAU avec les pays également
    public static  double[][] similarite(List country, List indicator, String Datedebut, String Datefin)
    {
        
      SessionFactory sessionFactory = HibernateUtil.getSessionFactory();  
      Session session = sessionFactory.openSession();  
      session.beginTransaction();
      
      List<double[][]> valeur_similarite = new ArrayList<double[][]>();
      country = ListCountryName_vers_CountryCode(country, session);
      indicator =ListIndicatorName_vers_IndicatorCode(indicator,session);
      for (int i=0; i<indicator.size();i++)
      {
          double[] valeur_pays_totaux = select_pays_total_indicateur(Liste_pays_total(),(String) indicator.get(i), Datedebut, Datefin, session);
     double difference = plus_grande_difference (valeur_pays_totaux);
          valeur_similarite.add(similarite_valeur_pays_one_indicateur(select_pays_total_indicateur(country,(String) indicator.get(i), Datedebut, Datefin, session), difference));
      }
      
     double[][] valeur = moyenne_tableau(valeur_similarite);
     for(int i=0;i<valeur.length;i++)
     {
        for(int j=0;j<valeur[i].length;j++)
        {
            System.out.print(valeur[i][j] + "\t");
        }
        System.out.println();
     }
      session.close();
      return valeur;
    }
    public static List ListIndicatorName_vers_IndicatorCode(List indicateur, Session session)
    {
        List IndicatorCode = new ArrayList();
        for(int i=0;i<indicateur.size();i++)
        {
            IndicatorCode.add(IndicatorName_vers_IndicatorCode((String)indicateur.get(i),session));
        }
        return IndicatorCode;
    }
    public static List ListCountryName_vers_CountryCode(List country, Session session)
    {
        List CountryCode = new ArrayList();
        for(int i=0;i<country.size();i++)
        {
            CountryCode.add(CountryName_vers_CountryCode((String)country.get(i),session));
        }
        return CountryCode;
    }
    public static String IndicatorName_vers_IndicatorCode(String indicateurname, Session session)
    {
        
         List results = null;
        String hql = "SELECT E.IndicatorCode FROM Indicateur E WHERE E.IndicatorName='"+indicateurname+"'";
        Query query = session.createQuery(hql);
        results = query.list();
        String indicateurcode = (String)results.get(0);
        return indicateurcode;
    }
    
    public static String CountryName_vers_CountryCode(String countryname, Session session)
    {
        List results = null;
        String hql = "SELECT E.CountryCode FROM Country E WHERE E.CountryName='"+countryname+"'";
        Query query = session.createQuery(hql);
        results = query.list();
        String countrycode = (String)results.get(0);
        return countrycode;
    }
        
    public static  double[][] moyenne_tableau  (List<double[][]> tableau)
    {
        //Il faut que les deux tableau aient la même taille
        double[][] nouveau_tableau = tableau.get(0);
        
        for(int k=1;k<tableau.size();k++)
        {
            for(int i=0; i< tableau.get(0).length;i++)
            {
            for(int j=0; j< tableau.get(0)[0].length;j++)
            {
                
                nouveau_tableau[i][j]= nouveau_tableau[i][j] + (tableau.get(k))[i][j];
            }
        }
        }
        nouveau_tableau = diviser_par_valeurtableau(nouveau_tableau, tableau.size());
        return nouveau_tableau;
    }
    public static double[][] diviser_par_valeurtableau(double[][]tableau, int x)
    {
            for(int i=0; i< tableau.length;i++)
            {
                
            for(int j=0; j< tableau[0].length;j++)
            {
                tableau[i][j]=tableau[i][j]/x;
                tableau[i][j] = (double)Math.round(tableau[i][j] * 100) / 100;
            }
            }
            return tableau;
    }
    public static List Liste_pays_total()
    {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();  
        Session session = sessionFactory.openSession();  
        session.beginTransaction();
        List results = null;
        String hql = "SELECT E.CountryCode FROM Country E";
        System.out.println(hql);
        Query query = session.createQuery(hql);
        results = query.list();
        session.close();
        return results;
        
    }
    
    public static  double select_pays_indicateur(String country, String indicateur, String Datedebut, String Datefin, Session session)
    {
        double valeur_pays =0;
        List results = null;
        String hql = "SELECT E.Valeur FROM IndicateurValeur E WHERE (E.Date BETWEEN "+Datedebut+" AND "+Datefin+") AND (E.CountryCode='"+ country +"') AND (E.IndicatorCode='"+indicateur +"')";
        Query query = session.createQuery(hql);
        results = query.list();
        for(int i=0;i<results.size();i++)
        {
            valeur_pays+= (double)results.get(i);
        }
        valeur_pays = valeur_pays/results.size();
       
        return valeur_pays;
    }
    
    public static double[]select_pays_total_indicateur(List country, String indicateur, String Datedebut, String Datefin, Session session)
    {
        double[] valeur_pays = new double[country.size()];
        for(int i=0; i< country.size();i++)
        {
            valeur_pays[i] = select_pays_indicateur((String)country.get(i), indicateur, Datedebut, Datefin, session);
        }
        return valeur_pays;
    }
    
    public static double plus_grande_difference (double[]valeur)
    {
        double max = valeur[0];
        double min = valeur[0];
        for(int i=0;i<valeur.length;i++)
        {
            if(valeur[i]>max)
            {
                max = valeur[i];
            }
             if(valeur[i]<min)
            {
                min = valeur[i];
            }
        }
        double difference = max -min;
        return difference;
    }
    
    public static double calcul_similarite_deux_pays(double pays_1, double pays_2, double difference)
    {
        double valeur_1 = 0;
        double valeur_2 = 0;
        if(pays_1>pays_2)
        {
            valeur_1 = pays_1;
            valeur_2 = pays_2;
        }
        else
        {
            valeur_1 = pays_2;
            valeur_2 = pays_1;
        }
        double valeur = 1 - ((valeur_1 - valeur_2)/difference);
        
        return valeur;
    }
    
    public static double[][] similarite_valeur_pays_one_indicateur(double[]valeur, double difference)
    {
        
        double[][] similarite_valeur = new double[valeur.length][valeur.length];
        for(int i =0; i< valeur.length; i++)
        {
           for(int j =0; j< valeur.length; j++)
            {
                if(difference==0)
                {
                    similarite_valeur[i][j] = 0;
                }
                else
                {
                    similarite_valeur[i][j] = calcul_similarite_deux_pays(valeur[i], valeur[j],difference);
                }
            } 
        }
        return similarite_valeur;
    }
    
     @RequestMapping(value="/similarite", method = RequestMethod.GET)
    public String comparerPays(HttpServletRequest request, ModelMap pModel) {
    
    
    List<String> pays = new ArrayList<String>();
    List<String> indicateurs = new ArrayList<String>();
    
    for (int i = 0 ; i < 3 ; i++) {
        System.out.println(request.getParameter("pays"+(i+1)));
            pays.add(request.getParameter("pays"+(i+1)));
            pModel.addAttribute("pays"+(i+1),request.getParameter("pays"+(i+1)) );
            // ajout des pays dans le PMODEL
    }
    for (int i = 0 ; i < 3 ; i++) {
        System.out.println(request.getParameter("indicateur"+(i+1)));
            indicateurs.add(request.getParameter("indicateur"+(i+1)));
            pModel.addAttribute("indic"+(i+1),request.getParameter("indicateur"+(i+1)) );
            // ajout des pays dans le PMODEL
    }
    
    String period = request.getParameter("Periode");
    
     pModel.addAttribute("Periode",period); 
    
    String[] periodCut = period.split("-");
    String Datedebut = periodCut[0];
    String Datefin = periodCut[1] ;
  
         System.out.println("Debut -"+Datedebut);
         System.out.println("Fin -"+Datefin);
         
       Object[][] result = Tableau_similarite (pays, indicateurs,Datedebut,Datefin);  
       
       
         for (int i = 1; i < result.length; i++) {
             for (int j = 1; j < result[i].length; j++) {
                 pModel.addAttribute("val" + (j) + "et" + (i), result[i][j]);
             }
         }
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();  
        Session session = sessionFactory.openSession();  
        session.beginTransaction();
        
        List<Country> listePays = session.createQuery("FROM Country E").list();
        List<Country> listeIndicateurs = session.createQuery("FROM Indicateur E").list();
        
        pModel.addAttribute("listePays", listePays);
        pModel.addAttribute("listeIndicateurs", listeIndicateurs);
        
        session.close();
       pModel.addAttribute("tableau result",result);      
    return "similarite";
    }
    
    
   public static Object[][] Tableau_similarite(List country, List indicator, String Datedebut, String Datefin)
    {
        double[][]tab_sim_old = similarite(country,indicator,Datedebut,Datefin);
        Object[][] tab_sim_new= new Object[tab_sim_old.length+1][tab_sim_old.length+1];
        tab_sim_new[0][0] = "";
        //Remplissage des entêtes du tableau
        for(int i=1;i<tab_sim_new.length;i++)
        {
            tab_sim_new[0][i] = country.get(i-1);
            tab_sim_new[i][0] = country.get(i-1);
        }
        //Remplissage du nouveau tableau avec les valeurs
        for(int i=1;i<tab_sim_new.length;i++)
        {
        for(int j=1;j<tab_sim_new[i].length;j++)
        {
            if(tab_sim_old[i-1][j-1]==0)
            {
                 tab_sim_new[i][j] = "-";
            }
            else
            {
                 tab_sim_new[i][j] = tab_sim_old[i-1][j-1];
            }
        }
        
        }
        return tab_sim_new;
    }
    
}

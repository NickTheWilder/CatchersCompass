using System;
using System.Globalization;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GMap.NET;
using GMap.NET.MapProviders;
using GMap.NET.WindowsForms;
using GMap.NET.WindowsForms.Markers;
using System.Xml;
using System.Data;
using System.IO;
using System.Xml.Linq;

namespace CatchersCompass
{
    public partial class MapPage : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\CatcherDatabase.mdf;Integrated Security=True");
        String fisherman;
        int fishid = 1;

        XmlWriterSettings xmlWriterSettings = new XmlWriterSettings()
        {
            Indent = true,
            IndentChars = "\t",
            NewLineOnAttributes = true
        };


        protected void Page_Load(object sender, EventArgs e)
        {
            GMapProviders.GoogleMap.ApiKey = @"AIzaSyASPpPzFRSvZNqTIbJ-dRAObwTScTNoEpI";
            fisherman = Session["UserName"].ToString();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string x = lbl2.Value; //Latitude
            string y = lbl1.Value; //Longitude
            float latitude;
            float longitude;

            //Testing if the coordinates are properly stored into float variables above
            bool success = float.TryParse(x, out latitude);
            if (success)
            {
                Console.WriteLine("no error");
            }
            else
            {
                Console.WriteLine("error");
            }
            bool success2 = float.TryParse(y, out longitude);
            if (success2)
            {
                Console.WriteLine("no error");
            }
            else
            {
                Console.WriteLine("error");
            }

            //Sending everything to the SQL DB
            //string dat = "INSERT INTO [Fish](Fish_Species, Fish_Length, Fish_Weight, Fish_Description, Fish_Fisherman, Fish_Lat, Fish_Long) VALUES (@fs, @fl, @fw, @fd, @ff, @fla, @flo)";
            //SqlCommand com = new SqlCommand(dat, con);
            //com.Parameters.AddWithValue("@fs", SpeciesBox.Text);
            //com.Parameters.AddWithValue("@fl", LengthBox.Text);
            //com.Parameters.AddWithValue("@fw", WeightBox.Text);
            //com.Parameters.AddWithValue("@fd", DescriptionBox.Text);
            //com.Parameters.AddWithValue("@ff", fisherman);
            //com.Parameters.AddWithValue("@fla", latitude); //Latitude
            //com.Parameters.AddWithValue("@flo", longitude); //Longitude
            //con.Open();
            //com.ExecuteNonQuery();
            //con.Close();

            //If the file fish.xml does not exist create a new one, this will save our fish data
            if (!File.Exists("C:\\Users\\Conor McQuillan\\Downloads\\CatchersCompassFinal\\CatchersCompassFinal\\CatchersCompass\\CatchersCompass\\Fish.xml"))
            {
                using (XmlWriter writer = XmlWriter.Create("C:\\Users\\Conor McQuillan\\Downloads\\CatchersCompassFinal\\CatchersCompassFinal\\CatchersCompass\\CatchersCompass\\Fish.xml", xmlWriterSettings))
                {
                    writer.WriteStartElement("Catch");
                    writer.WriteStartElement("Fish");
                    writer.WriteElementString("FishID", fishid.ToString());
                    writer.WriteElementString("FishSpecies", SpeciesBox.Text);
                    writer.WriteElementString("FishLength", LengthBox.Text);
                    writer.WriteElementString("FishWeight", WeightBox.Text);
                    writer.WriteElementString("FishDescription", DescriptionBox.Text);
                    writer.WriteElementString("FishFisherman", fisherman);
                    writer.WriteElementString("FishLatitude", latitude.ToString());
                    writer.WriteElementString("FishLongitude", longitude.ToString());
                    writer.WriteEndElement();
                    writer.WriteEndElement();
                }
            }
            //If it does exist append a new fish to the xml document
            else
            {
                //get value of last fish id and increment
                using (XmlReader reader = XmlReader.Create("C:\\Users\\Conor McQuillan\\Downloads\\CatchersCompassFinal\\CatchersCompassFinal\\CatchersCompass\\CatchersCompass\\Fish.xml"))
                {
                    while (reader.Read())
                    {
                        if (reader.IsStartElement())
                        {
                            switch (reader.Name.ToString())
                            {
                                case "FishID":
                                    fishid = Int16.Parse(reader.ReadString());
                                    fishid++;
                                    break;
                            }
                        }
                    }
                }
                //append the xml document
                XDocument xDocument = XDocument.Load("C:\\Users\\Conor McQuillan\\Downloads\\CatchersCompassFinal\\CatchersCompassFinal\\CatchersCompass\\CatchersCompass\\Fish.xml");
                XElement root = xDocument.Element("Catch");
                IEnumerable<XElement> rows = root.Descendants("Fish");
                XElement firstRow = rows.First();
                firstRow.Add(
                   new XElement("Fish",
                   new XElement("FishID", fishid.ToString()),
                   new XElement("FishSpecies", SpeciesBox.Text),
                   new XElement("FishLength", LengthBox.Text),
                   new XElement("FishWeight", WeightBox.Text),
                   new XElement("FishDescription", DescriptionBox.Text),
                   new XElement("FishFisherman", fisherman),
                   new XElement("FishLatitude", latitude.ToString()),
                   new XElement("FishLongitude", longitude.ToString())));
                xDocument.Save("C:\\Users\\Conor McQuillan\\Downloads\\CatchersCompassFinal\\CatchersCompassFinal\\CatchersCompass\\CatchersCompass\\Fish.xml");
            }

            //Reseting the form
            SpeciesBox.Text = "";
            LengthBox.Text = "";
            WeightBox.Text = "";
            DescriptionBox.Text = "";
        }
    }
}
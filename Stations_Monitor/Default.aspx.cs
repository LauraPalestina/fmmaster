using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management;
using ARC_Library.Station;
using System.Configuration;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Net;
using System.IO;    

namespace Stations_Monitor
{
    public partial class _Default : Page
    {

        string cadConecction = ConfigurationManager.ConnectionStrings["ConnectionMonitor"].ToString();

        csStation dtStation = new csStation();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblMessage.Visible = false;
                btnFirstShift.Visible = false;
                btnSecondShift.Visible = false;
                btnThirdShift.Visible = false;                    

                ManagementObjectSearcher query = null;
                ManagementObjectCollection queryCollection = null;

                try
                {
                    query = new ManagementObjectSearcher("SELECT * FROM Win32_NetworkAdapterConfiguration");
                    queryCollection = query.Get();
                    foreach (ManagementObject mo in queryCollection)
                    {
                        if (mo["MacAddress"] != null)
                        {

                            DataTable dtCell = new DataTable();
                            dtCell = dtStation.GetCellbyMAC(mo["MacAddress"].ToString().Trim());

                            if (dtCell.Rows.Count >= 1)
                            {
                                lblCellID.Text = dtCell.Rows[0]["cell_id"].ToString();

                                string _time = System.DateTime.Now.ToString("HH:mm");
                                string _hour = _time.Substring(0, 2);
                                string _minute = _time.Substring(3, 2);

                                int _min = Convert.ToInt32(_minute);
                                int _hr = Convert.ToInt32(_hour);

                                if (_hr >= 8 && _hr <= 23)
                                {
                                    lblProductionDate.Text = System.DateTime.Now.ToString("MMM/dd/yyyy");
                                }
                                else
                                {
                                    lblProductionDate.Text = System.DateTime.Now.AddDays(-1).ToString("MMM/dd/yyyy");
                                }

                                Session["ValidAddress"] = "Yes";
                            }
                            else
                            {
                                lblCellID.Text = "Not autorized to open this webpage";
                                Session["ValidAddress"] = "No";
                            }
                        }
                    }                    
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.Visible = true;
                }
            }
        }

        protected void btnFirstShift_Click(object sender, EventArgs e)
        {
             Response.Redirect("Production.aspx?id=1," + lblCellID.Text.Trim() + lblProductionDate.Text.Trim());
            
        }

        protected void btnSecondShift_Click(object sender, EventArgs e)
        {
            Response.Redirect("Production.aspx?id=2," + lblCellID.Text.Trim() + lblProductionDate.Text.Trim());
        }

        protected void btnThirdShift_Click(object sender, EventArgs e)
        {
            Response.Redirect("Production.aspx?id=3," + lblCellID.Text.Trim() + lblProductionDate.Text.Trim());
        }
    }
}
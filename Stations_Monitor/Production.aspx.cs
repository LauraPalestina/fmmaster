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
using ARC_Library.Production;

namespace Stations_Monitor
{
    public partial class Production : Page
    {
        string cadConecction = ConfigurationManager.ConnectionStrings["ConnectionMonitor"].ToString();

        csStation dtStation = new csStation();
        csProduction dtProduction = new csProduction();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int mac_found = 0;
                ManagementObjectSearcher query = null;
                ManagementObjectCollection queryCollection = null;
                lblMessage.Visible = false;

                try
                {
                    query = new ManagementObjectSearcher("SELECT * FROM Win32_NetworkAdapterConfiguration");
                    queryCollection = query.Get();
                    foreach (ManagementObject mo in queryCollection)
                    {
                        if (mo["MacAddress"] != null)
                        {
                            mac_found = 1;

                            DataTable dtCell = new DataTable();
                            DataTable dtDataProduction = new DataTable();

                            dtCell = dtStation.GetCellbyMAC(mo["MacAddress"].ToString().Trim());

                            if (dtCell.Rows.Count >= 1)
                            {
                                lblCellID.Text = dtCell.Rows[0]["cell_id"].ToString();
                                string _data = Request.QueryString["id"];
                                string[] data = _data.Split(',');
                                lblCellID.Text = data[1].ToString();

                                dtDataProduction = dtProduction.GetProductionByDateByShift(dtCell.Rows[0]["cell_id"].ToString(), "2019/08/28", data[0].ToString());
                                if (dtDataProduction.Rows.Count > 1)
                                {
                                    //test
                                    //tes
                                    
                                    GridView1.DataSource = dtDataProduction;
                                    GridView1.DataBind();
                                    //cfsdsdfksdfjpskf
                                    Session["DataProduction"] = dtDataProduction;
                                    Session["Cell"] = dtCell.Rows[0]["cell_id"].ToString();
                                    Session["ProductionDate"] = "2019/08/28";
                                    Session["Shift"] = data[0].ToString();

                                    lblProductionDate.Text = "2019/08/28";
                                    lblShift.Text = data[0].ToString();
                                    txtEmployeeId.Text = dtDataProduction.Rows[0]["employee"].ToString();
                                    lblLine.Text = dtDataProduction.Rows[0]["cell_id"].ToString().Substring(0,1);
                                    lblShift.Text = dtDataProduction.Rows[0]["shift"].ToString().Substring(0, 1);
                                    lblTotalGood.Text = dtDataProduction.AsEnumerable().Sum(x => x.Field<int>("good_parts")).ToString();
                                }
                            }
                            else
                            {
                                lblCellID.Text = "Not autorized to open this webpage";
                            }
                        }
                    }

                    if (mac_found == 0)
                    {

                    }
                }
                catch (Exception ex)
                {
                    
                    lblMessage.Text=ex.Message;
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GridView1_DataBinding(object sender, EventArgs e)
        {
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
        }

        private void BindData()
        {

            GridView1.DataSource = Session["DataProduction"];
            GridView1.DataBind();

            DataTable dtDataProduction = (DataTable)Session["DataProduction"];

            lblTotalGood.Text = dtDataProduction.AsEnumerable().Sum(x => x.Field<int>("good_parts")).ToString();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindData();

            lblMessage.Visible = false;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblMessage.Visible = false;


            int _idrecdet = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString().Trim());
            TextBox txtTotalParts = GridView1.Rows[e.RowIndex].FindControl("txtTotalParts") as TextBox;
            TextBox txtScrapParts = GridView1.Rows[e.RowIndex].FindControl("txtScrapParts") as TextBox;
            TextBox txtQXParts = GridView1.Rows[e.RowIndex].FindControl("txtQXParts") as TextBox;
            TextBox txtScrapDescription = GridView1.Rows[e.RowIndex].FindControl("txtScrapDescription") as TextBox;
            TextBox txtComment = GridView1.Rows[e.RowIndex].FindControl("txtComment") as TextBox;

            int _valtotal;
            int _valscrap;
            int _valqx;

            bool _validtotal = Int32.TryParse(txtTotalParts.Text, out _valtotal);
            bool _validscrap = Int32.TryParse(txtScrapParts.Text, out _valscrap);
            bool _validqx = Int32.TryParse(txtQXParts.Text, out _valqx);


            if (_validtotal == true & _validscrap == true & _validqx == true)
            {
                int _totalparts = Convert.ToInt32(txtTotalParts.Text);
                int _scrapparts = Convert.ToInt32(txtScrapParts.Text);
                int _qxparts = Convert.ToInt32(txtQXParts.Text);
                string _scrapdescription = txtScrapDescription.Text.ToUpper();
                string _comment = txtComment.Text.ToUpper();

                if (_totalparts <= 500 & _scrapparts <= 100 & _qxparts <= 100)
                {
                    //udpate values 
                    dtProduction.UpdateProductionDetailsByID(_idrecdet, _totalparts, _scrapparts, _qxparts, _scrapdescription, _comment);

                    DataTable dtDataProduction = dtProduction.GetProductionByDateByShift(Session["Cell"].ToString(), Session["ProductionDate"].ToString(), Session["Shift"].ToString());
                    Session["DataProduction"] = dtDataProduction;

                    GridView1.EditIndex = -1;
                    BindData();
                }else
                {
                    lblMessage.Text = "Error de Validacion: Revisa numero piezas Total, Scrap o QX";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "Error de Validacion: Introduce solo numeros en las cantidades";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;

            }
        }

        protected void cbYes_CheckedChanged(object sender, EventArgs e)
        {
            if (cbYes.Checked == true)
            {
                cbNo.Checked = false;
            }
        }

        protected void cbNo_CheckedChanged(object sender, EventArgs e)
        {
            if (cbNo.Checked == true)
            {
                cbYes.Checked = false;
            }
        }
    }
}
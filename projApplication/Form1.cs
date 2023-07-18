using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace projApplication
{
    public partial class Form1 : Form
    {
        private string currentForm;
        private readonly MySqlConnection sqlConnection = new MySqlConnection("host=localhost;user=root;password=;database=spacetransportdb");
        private MySqlCommand sqlCommand;
        private readonly string[] contactArray = { "passenger", "company", "crewmate", "starship" };
        private readonly IDictionary<string, IEnumerable<Control>> formDictionary = new Dictionary<string, IEnumerable<Control>>();

        public Form1()
        {
            InitializeComponent();
            InitForms();
            OpenConnection();
            LoadTables();
            InitSearchBox();
        }

        // set defualt form 
        private void InitForms()
        {
            currentForm = tabControl.SelectedTab.Name;
            Control[] allForm = { passForm, comForm, fliForm, resForm, payForm, typeForm, shipForm, crewForm };
            for (int i = 0; i < allForm.Length; i++)
            {
                formDictionary.Add(tabControl.Controls[i].Name,
                    allForm[i].Controls.Cast<Control>()
                    .Where(control => (!(control is Label)) && (!(control is LinkLabel)) && (!(control is PictureBox))));
                ResetAllControls(allForm[i]);
            }
        }

        private void OpenConnection()
        {
            try
            {
                sqlConnection.Open();
            }
            catch (Exception)
            {
                MessageBox.Show("Please open your database server");
                Dispose();
                Application.Exit();
            }
        }


        private IEnumerable<Control> GetCurrentControls()
        {
            return formDictionary[currentForm];
        }

        private void OnTabChange(object sender, TabControlEventArgs e)
        {
            currentForm = e.TabPage.Name;
            LoadTables();
            InitComboBox();
            InitSearchBox();
        }

        private void InitComboBox()
        {
            foreach (Control control in GetCurrentControls())
            {
                if (control.Name.EndsWith("id"))
                {
                    string table = control.Name.Replace("__", ",").Split(',')[0];
                    AddItem(table, (ComboBox)control);
                }
            }
        }

        private void AddItem(string table, ComboBox comboBox)
        {
            string sql = $"SELECT distinct `id` FROM {table} ORDER BY `id`";
            sqlCommand = new MySqlCommand(sql, sqlConnection);
            MySqlDataReader reader = sqlCommand.ExecuteReader();
            comboBox.Items.Clear();
            comboBox.Items.Add("--- select ---");
            while (reader.Read())
            {
                comboBox.Items.Add(reader.GetString("id"));
            }
            reader.Close();
        }

        private void LoadTables(string condition = "")
        {
            dataTable.DataSource = new DataTable();
            string sql = $"SELECT * FROM {currentForm} ";
            if (contactArray.Contains(currentForm))
            {
                sql = $"SELECT a.*, c.mail,c.channel,c.tel FROM {currentForm} " +
                       "as a INNER JOIN contact as c ON a.id = c.id ";
            }
            sqlCommand = new MySqlCommand(sql + condition, sqlConnection);
            DataSet ds = new DataSet();
            MySqlDataAdapter da = new MySqlDataAdapter(sqlCommand);
            da.Fill(ds, currentForm);
            dataTable.DataSource = ds.Tables[currentForm].DefaultView;
        }

        private DataRowCollection FetchColumnNames(string table)
        {
            string columnSql = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS " +
                $"WHERE TABLE_SCHEMA = 'spacetransportdb' AND TABLE_NAME = '{table}'";
            sqlCommand = new MySqlCommand(columnSql, sqlConnection);
            DataSet ds = new DataSet();
            MySqlDataAdapter da = new MySqlDataAdapter(sqlCommand);
            da.Fill(ds, "COLUMN_NAME");
            return ds.Tables["COLUMN_NAME"].Rows;
        }

        private string AddParameters(string sql, IEnumerable<Control> controls)
        {
            string str = sql;
            foreach (Control control in controls)
            {
                str += $"@{control.Name}, ";
            }
            return $"{str.Substring(0, str.Length - 2)} )";
        }
        private string AddParameters(string sql, DataRowCollection rows)
        {
            string str = sql;
            string condition = "WHERE ";
            int firstColumn = 0;
            foreach (DataRow row in rows)
            {
                if (firstColumn == 0)
                {
                    condition += $"`{row["COLUMN_NAME"]}` = @";
                    firstColumn++;
                }
                else
                {
                    str += $"`{row["COLUMN_NAME"]}` = $$ , ";
                }
            }
            foreach (Control control in GetCurrentControls())
            {
                int idx = str.IndexOf("$$");
                if (firstColumn == 1)
                {
                    condition += control.Name;
                    firstColumn++;
                }
                else
                {
                    str = $"{str.Substring(0, idx)}@{control.Name + str.Substring(idx + 2)}";
                }
            }
            return str.Substring(0, str.Length - 2) + condition;
        }

        private void AddValues(IEnumerable<Control> controls)
        {
            foreach (Control control in controls)
            {
                string arg = "@" + control.Name;
                if (control is TextBox text)
                {
                    sqlCommand.Parameters.AddWithValue(arg, (text.Text.Trim() != "") ? text.Text : null);
                }
                else if (control is ComboBox box)
                {
                    sqlCommand.Parameters.AddWithValue(arg, (box.SelectedIndex > 0) ? box.SelectedItem : null);
                }
                else if (control is DateTimePicker date)
                {
                    sqlCommand.Parameters.AddWithValue(arg, date.Value.ToString("yyyy-MM-dd"));
                }
                else if (control is NumericUpDown numeric)
                {
                    sqlCommand.Parameters.AddWithValue(arg, numeric.Value);
                }
            }
        }

        private void ExecuteCommand(string query, string msg)
        {
            sqlCommand = new MySqlCommand(query, sqlConnection);
            AddValues(GetCurrentControls());

            try
            {
                int rowsAffected = sqlCommand.ExecuteNonQuery();
                MessageBox.Show($"{msg} Data Completed !");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"{msg} Data Incomplete !\n{ex.Message}");
            }
            LoadTables();
        }

        private void ResetAllControls(Control form)
        {
            foreach (Control control in form.Controls)
            {
                if (control is TextBox text)
                {
                    text.Clear();
                }
                else if (control is ComboBox box)
                {
                    box.SelectedIndex = 0;
                }
                else if (control is DateTimePicker date)
                {
                    date.Value = DateTime.Now;
                }
                else if (control is NumericUpDown num)
                {
                    num.Value = 0;
                }
            }
        }

        private void OnIsertBtnClick(object sender, EventArgs e)
        {
            string sql = $"INSERT INTO {currentForm} VALUES ( ";
            if (contactArray.Contains(currentForm))
            {
                sql = $"CALL handle_{currentForm} ( 'INSERT', ";
            }
            sql = AddParameters(sql, GetCurrentControls());
            MessageBox.Show(sql);
            ExecuteCommand(sql, "INSERT");
        }
        private void OnUpdateBtnClick(object sender, EventArgs e)
        {
            DataRowCollection rows = FetchColumnNames(currentForm);
            string sql = $"UPDATE {currentForm} SET ";
            if (contactArray.Contains(currentForm))
            {
                sql = $"CALL handle_{currentForm} ( 'UPDATE', ";
                sql = AddParameters(sql, GetCurrentControls());
            }
            else
            {
                sql = AddParameters(sql, rows);
            }
            ExecuteCommand(sql, "UPDATE");
        }

        private void OnDeleteBtnClick(object sender, EventArgs e)
        {
            string sql = $"DELETE FROM {currentForm} WHERE `id` = @{GetCurrentControls().First().Name}";
            ExecuteCommand(sql, "DELETE");
        }

        private void OnRefreshBtnClick(object sender, EventArgs e)
        {
            LoadTables();
            searchComboBox.SelectedIndex = 0;
            searchText.Clear();
        }

        private void OnResetForm(object sender, LinkLabelLinkClickedEventArgs e)
        {
            LinkLabel linkLabel = (LinkLabel)sender;
            ResetAllControls(linkLabel.Parent);
        }

        private void OnCellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1 && e.RowIndex != dataTable.RowCount - 1)
            {
                DataGridViewCellCollection cells = dataTable.Rows[e.RowIndex].Cells; 
                int idx = 0;
                foreach (Control control in GetCurrentControls())
                {
                    string value = cells[idx].Value.ToString();
                    if (idx == e.ColumnIndex || e.ColumnIndex == -1)
                    {
                        if (control is TextBox textBox)
                        {
                            textBox.Text = value;
                        }
                        else if (control is ComboBox box)
                        {
                            box.SelectedItem = value;
                        }
                        else if (control is DateTimePicker datePicker)
                        {
                            datePicker.Value = DateTime.Parse(value);
                        }
                        else if (control is NumericUpDown num)
                        {
                            num.Value = decimal.Parse(value);
                        }
                    }
                    idx++;
                }
            }
        }

        private void OnSearchChange(object sender, EventArgs e)
        {
            TextBox searchBox = (TextBox)sender;
            if (searchBox.Text.Trim() != "" && searchComboBox.SelectedIndex > 0)
            {
                string sql = "WHERE ";
                if (contactArray.Contains(currentForm))
                {
                    sql = "WHERE a.";
                }
                LoadTables($"{sql}`{searchComboBox.SelectedItem}` LIKE '%{searchBox.Text}%' ");
            }
        }

        private void InitSearchBox()
        {
            searchComboBox.Items.Clear();
            searchComboBox.Items.Add("--- select ---");
            searchComboBox.SelectedIndex = 0;
            foreach (DataRow row in FetchColumnNames(currentForm))
            {
                searchComboBox.Items.Add(row["COLUMN_NAME"]);
            }

        }
    }
}

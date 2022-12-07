Class Workshop.Excel
{

/// https://openpyxl.readthedocs.io/en/latest/pandas.html
ClassMethod Test() As %Status [ Language = python ]
{
    from openpyxl import Workbook
    from openpyxl.utils.dataframe import dataframe_to_rows
    
    wb = Workbook()
    ws = wb.active

    import iris
    statement = iris.sql.prepare("SELECT id, dob, firstname, lastname, homeaddress_city, homeaddress_state FROM Workshop_Data.Person")
    df = statement.execute().dataframe()
    
    for r in dataframe_to_rows(df, index=True, header=True):
        ws.append(r)
    
    for cell in ws['A'] + ws[1]:
        cell.style = 'Pandas'
    
    wb.save("/app/openpyxl.xlsx")

    status = 1
    return status
}

}

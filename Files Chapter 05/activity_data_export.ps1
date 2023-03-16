## Login
Login-PowerBI

## Set initial parameters
$outFilePath = "C:/Users/yidav/OneDrive - SDInnovation/Book/Chapter 05/Files Chapter 05/Usage/activities"
$nbrDaysToGoBack = 7
$consolidatedDataset = @()

for ($i = 1; $i -le $nbrDaysToGoBack; $i++)
{
    ## set boundaries
    $startDateToExtract = (((Get-Date).AddDays(-$i)).ToUniversalTime()).ToString('yyyy-MM-ddT00:00:00.000')
    $endDateToExtract = (((Get-Date).AddDays(-$i)).ToUniversalTime()).ToString('yyyy-MM-ddT23:59:59.999')
    $activities = ''

    ## Run GetActivityEvent API
    $activities = Get-PowerBIActivityEvent -StartDateTime $startDateToExtract -EndDateTime $endDateToExtract

    ## prepare output file name in folder
    $displaydate = (((Get-Date).AddDays(-$i)).ToUniversalTime()).ToString('yyyy-MM-dd')
    $outfile_name = "$outFilePath" + "_$displaydate.json"
    $activities | Out-File -FilePath $outfile_name
}
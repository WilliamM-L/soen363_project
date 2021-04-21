//Count of crimes per hour for the year 2008
db.crime.aggregate([
    {
        $match: { year: 2008 }
    },
    
    
   {
        $sortByCount: { $hour: "$date" }

    }
    


])

//Count of crimes per hour for all years
db.crime.aggregate([
    {
        $sortByCount: { $hour: "$date" }

    }


]) 

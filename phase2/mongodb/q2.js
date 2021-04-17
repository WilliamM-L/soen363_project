//Count of crimes per type of crime & year
db.crimes.aggregate([
    {
        "$group" : 
        {
            _id:{year: "$year", primary_type: "$primary_type"},
            count:{$sum:1}
        }
    }
])

//Homicides per year
db.crimes.aggregate([
    {
        "$group" : 
        {
            _id:{year: "$year", primary_type: /^HOMICIDE/}, 
            count:{$sum:1}
        }
    }
])

//3T Generated: Count of crimes per type of crime & year
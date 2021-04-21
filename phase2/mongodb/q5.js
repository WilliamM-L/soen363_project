db.crime.aggregate([
    {
            "$group" : {_id : {primary_type:"$primary_type", arrest:"$arrest"}, count:{$sum:1}}
    },
    {

        "$facet": {

            "num_of_arrest": [
                { "$match": { arrest: true } },
                { "$count": "num_of_arrest" }

            ],
            "num_of_nonarrest": [
                { "$match": { arrest: true } },
                { "$count": "num_of_nonarrest" }

            ],
            "Total": [
                { "$count": "Total" }
            ]


        }
    },

    {
        $project: {
            "Possession": { "$arrayElemAt": ["$num_of_nonarrest.num_of_nonarrest", 0] },
            "Delivery": { "$arrayElemAt": ["$num_of_nonarrest.num_of_nonarrest", 0] },
            "Total": { "$arrayElemAt": ["$Total.Total", 0] }

        }
    }

]);

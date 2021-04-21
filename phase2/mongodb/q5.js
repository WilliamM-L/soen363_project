db.crime.aggregate([
    {
        "$group" : {
            "_id" : {
                "primary_type" : "$primary_type",
            },
            "num_crimes" : {
                "$sum" : 1
            }
        }


    },
    {
        "$facet": {

            "Arrest_count": [
                { "$match": { arrest: true } },
                { "$count": "Arrest_count" }

            ]



        }
    },

    {
            "$project" : {
                "primary_type" : "$_id.primary_type",
                "num_crimes" : "$num_crimes",
                "Arrest_count": { "$arrayElemAt": ["$Arrest_count.Arrest_count", 0] }
            }
        },


]);

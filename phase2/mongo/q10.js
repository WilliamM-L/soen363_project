//Count of drug-related crimes per activity related to the drug
db.crime.aggregate([

    {
        "$facet": {

            "Possession": [
                { "$match": { $and: [{ description: /POSS/ }, { fbi_code: '18' }] } },
                { "$count": "Possession" }

            ],
            "Delivery": [
                { "$match": { $and: [{ description: /MANU/ }, { fbi_code: '18' }] } },
                { "$count": "Delivery" }

            ],
            "Total": [
                { $match: { primary_type: 'NARCOTICS' } },
                { "$count": "Total" }
            ]


        }
    },

    {
        $project: {
            "Possession": { "$arrayElemAt": ["$Possession.Possession", 0] },
            "Delivery": { "$arrayElemAt": ["$Delivery.Delivery", 0] },
            "Total": { "$arrayElemAt": ["$Total.Total", 0] }

        }
    }

])
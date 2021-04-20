//Count of drug-related crimes per activity related to the drug
db.crime.aggregate([
    {
        $match: { fbi_code: '18' }
    },
    {
        "$facet": {

            "Possession": [
                { "$match": { description: /POSS/ } },
                { "$count": "Possession" }

            ],
            "Delivery": [
                { "$match": { description: /MANU/ } },
                { "$count": "Delivery" }

            ],
            "Total": [
                { $match: { fbi_code: '18' } },
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
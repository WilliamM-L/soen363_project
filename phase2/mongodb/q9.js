// Rate of crime of top 4 drugs
db.crime.aggregate([
    {
        $match: { fbi_code: '18' }
    },
    {
        "$facet": {

            "Cannabis": [
                { "$match": { description: /CANNABIS/ } },
                { "$count": "Cannabis" }

            ],
            "Crack": [
                { "$match": { description: /CRACK/ } },
                { "$count": "Crack" }

            ],
            "Heroin": [
                { "$match": { description: /HEROIN/ } },
                { "$count": "Heroin" }

            ],
            "Cocaine": [
                { "$match": { description: /COCAINE/ } },
                { "$count": "Cocaine" }

            ],
            "Total": [
                { $match: { fbi_code: '18' } },
                { "$count": "Total" }
            ]
        }
    },
    {
        $project: {
            "Cannabis": { "$arrayElemAt": ["$Cannabis.Cannabis", 0] },
            "Crack": { "$arrayElemAt": ["$Crack.Crack", 0] },
            "Heroin": { "$arrayElemAt": ["$Heroin.Heroin", 0] },
            "Cocaine": { "$arrayElemAt": ["$Cocaine.Cocaine", 0] },
            "Total": { "$arrayElemAt": ["$Total.Total", 0] }
        }
    }

])
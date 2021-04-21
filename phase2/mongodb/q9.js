// Rate of crime of top 4 drugs
db.crime.aggregate([
    {
        "$facet": {

            "Cannabis": [
                { "$match": { $and: [{ description: /CANNABIS/ }, { fbi_code: '18' }] } },
                { "$count": "Cannabis" }

            ],
            "Crack": [
                { "$match": { $and: [{ description: /CRACK/ }, { fbi_code: '18' }] } },
                { "$count": "Crack" }

            ],
            "Heroin": [
                { "$match": { $and: [{ description: /HEROIN/ }, { fbi_code: '18' }] } },
                { "$count": "Heroin" }

            ],
            "Cocaine": [
                { "$match": { $and: [{ description: /COCAINE/ }, { fbi_code: '18' }] } },
                { "$count": "Cocaine" }

            ],
            "Total": [
                { $match: { primary_type: 'NARCOTICS' } },
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
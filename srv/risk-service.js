const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {

    const { Risks, BusinessPartners } = this.entities;
    this.after('READ', Risks, function (data) {

        const risks = Array.isArray(data) ? data : [data];
        console.log("print critical")

        risks.forEach((risk) => {
            if (risk.impact >= 100000) {
                risk.criticality = 1;
            } else {
                risk.criticality = 2;
            }
            switch (risk.prio_code) {
                case 'H':
                    risk.PrioCriticality = 1;
                    break;
                case 'M':
                    risk.PrioCriticality = 2;
                    break;
                case 'L':
                    risk.PrioCriticality = 3;
                    break;
            }
        })
    });

    const BPsrv = await cds.connect.to("API_BUSINESS_PARTNER");

    this.on("READ", BusinessPartners, async (req) => {
        
        req.query.where("LastName <> '' and FirstName <> '' ");
        console.log(process.env.apikey)

        return await BPsrv.transaction(req).send({
            query: req.query,
            headers: {
                apikey: process.env.apikey,
            },
        })
    })
})
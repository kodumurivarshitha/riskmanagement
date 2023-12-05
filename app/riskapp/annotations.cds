using RiskService as service from '../../srv/risk-service';
using from '../../db/schema';

annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Owner',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Descr',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Impact',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : 'descr',
        },
        {
            $Type : 'UI.DataField',
            Value : prio_code,
            Label : 'prio_code',
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Value : bp.FullName,
            Label : 'FullName',
        },
    ]
);
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risksection',
            ID : 'Risksection',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk',
                    ID : 'Risk',
                    Target : '@UI.FieldGroup#Risk',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation Overview',
            ID : 'MitigationOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation',
                    ID : 'Mitigation',
                    Target : '@UI.FieldGroup#Mitigation',
                },],
        },]
);
annotate service.Risks with @(
    UI.FieldGroup #Risk : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy,
                Criticality : criticality,
            },{
                $Type : 'UI.DataField',
                Value : descr,
                Label : 'Description',
            },{
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },{
                $Type : 'UI.DataField',
                Value : impact,
                Label : 'Impact',
                Criticality : criticality,
            },{
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },{
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },{
                $Type : 'UI.DataField',
                Value : owner,
                Label : 'Owner',
            },{
                $Type : 'UI.DataField',
                Value : title,
                Label : 'Title',
            },],
    }
);
annotate service.Risks with @(
    UI.HeaderInfo : {
        TypeName : 'Risk',
        TypeNamePlural : 'Risks',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
    }
);
annotate service.Risks with @(
    UI.FieldGroup #Mitigation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : 'Owner',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : 'Timeline',
            },
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : 'Description',
            },],
    }
);
annotate service.Risks with {
    miti @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'Mitigation',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Mitigations with {
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Risks with {
    title @Common.FieldControl : #ReadOnly
};
annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};
annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};

annotate service.Risks with {
    miti @Common.Text : descr
};
annotate service.Risks with {
    prio @Common.Text : prio_code
};
annotate service.Risks with {
    prio @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Priority',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : prio_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'PrioCriticality',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Priority with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

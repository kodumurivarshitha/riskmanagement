namespace riskmanagement;

using { //using keyword is used to define the aspects or call the aspects first to use them further
    managed,
    cuid,
    sap.common.CodeList
} from '@sap/cds/common'; //importing libraries from common

using {API_BUSINESS_PARTNER as external} from '../srv/external/API_BUSINESS_PARTNER.csn';


entity BusinessPartners as
    projection on external.A_BusinessPartner {
        key BusinessPartner,
            BusinessPartnerFullName as FullName,
    }

entity Risks : cuid, managed {
    title           : String(100);
    owner           : String;
    prio            : Association to Priority;
    miti            : Association to Mitigations;
    descr           : String;
    impact          : Integer;
    bp              : Association to BusinessPartners;
    criticality     : Integer;
    PrioCriticality : Integer;

}

entity Mitigations : cuid, managed {
    descr    : String;
    owner    : String;
    timeline : String;
    risks    : Association to many Risks
                   on risks.miti = $self;

}

entity Priority : CodeList {
    key code : String enum {
            high   = 'H';
            medium = 'M';
            low    = 'L';
        };
}

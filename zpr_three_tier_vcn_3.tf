locals {
  tt_3_zpr_policies = merge(
    var.add_tt_vcn3 ? {
      ZPR-POLICY-TT-3 = {
        description = "ZPR policies for TT VCN 3"
        name = "zpr-policy-tt-vcn-3"
        statements = [
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.app:${local.zpr_label} endpoints to connect to ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints with protocol='tcp/1521-1522'",
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.bastion:${local.zpr_label} endpoints to connect to ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints with protocol='tcp/22'",
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints to connect to 'osn-services-ip-addresses' with protocol='tcp/443'",
        ]
      }
    } : {}

    var.add_tt_vcn3 && var.add_tt_vcn1 ? {
      ZPR-POLICY-TT-VCN-3-TO-TT-VCN-1 = {
        description = "ZPR policies for TT VCN 3 to TT VCN 1"
        name = "zpr-policy-tt-vcn-3-to-tt-vcn-1"
        statements = [
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.tt_vcn1_db_subnet_cidr} endpoints to connect to ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} with protocol='tcp/1521-1522'",
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints to connect to ${var.tt_vcn1_db_subnet_cidr} with protocol='tcp/1521-1522'",
        ]
      } 
    } : {}

    var.add_tt_vcn3 && var.add_tt_vcn2 ? {
      ZPR-POLICY-TT-VCN-3-TO-TT-VCN-2  {
        description = "ZPR policies for TT VCN 3 and TT VCN 2"
        name = "zpr-policy-tt-vcn-3-tt-vcn-2"
        statements = [
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.tt_vcn2_db_subnet_cidr} endpoints to connect to ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} with protocol='tcp/1521-1522'",
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints to connect to ${var.tt_vcn2_db_subnet_cidr} with protocol='tcp/1521-1522'"
        ]
      }
    } : {}

    var.add_tt_vcn3 && var.add_exa_vcn1 ? {
      ZPR-POLICY-TT-VCN-3-TO-EXA-VCN-1 = {
        description = "ZPR policies for TT VCN 3 TO Exadata VCN 1"
        name = "zpr-policy-tt-vcn-3-to-exa-vcn-1"
        statements = [
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints to connect to ${var.exa_vcn1_client_subnet_cidr} with protocol='tcp/1521-1522'",
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.exa_vcn1_client_subnet_cidr} endpoints to connect to ${var.tt_vcn3_db_subnet_cidr} with protocol='tcp/1521-1522'"
        ]
      }
    } : {}

    var.add_tt_vcn3 && var.add_exa_vcn2 ? {
      ZPR-POLICY-TT-VCN-3-TO-EXA-VCN-2 = {
        description = "ZPR policies for TT VCN 3 TO Exadata VCN 2"
        name = "zpr-policy-tt-vcn-3-to-exa-vcn-2"
        statements = [
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints to connect to ${var.exa_vcn2_client_subnet_cidr} with protocol='tcp/1521-1522'",
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.exa_vcn2_client_subnet_cidr} endpoints to connect to ${var.tt_vcn3_db_subnet_cidr} with protocol='tcp/1521-1522'"
        ]
      }
    } : {}

    var.add_tt_vcn3 && var.add_exa_vcn3 ? {
      ZPR-POLICY-TT-VCN-3-TO-EXA-VCN-3 = {
        description = "ZPR policies for TT VCN 3 TO Exadata VCN 3"
        name = "zpr-policy-tt-vcn-3-to-exa-vcn-3"
        statements = [
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.zpr_security_attributes_namespace}.database:${local.zpr_label} endpoints to connect to ${var.exa_vcn3_client_subnet_cidr} with protocol='tcp/1521-1522'",
          "in ${var.zpr_security_attributes_namespace}.net:tt-vcn-3-${local.zpr_label} VCN allow ${var.exa_vcn3_client_subnet_cidr} endpoints to connect to ${var.tt_vcn3_db_subnet_cidr} with protocol='tcp/1521-1522'"
        ]
      }
    } : {}
  )
}

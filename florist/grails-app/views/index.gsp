<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
        
        <div id="pageBody">
            <h1>Florist ERP System</h1>
            

            <div id="controllerList" class="dialog">
                <h1>Available Functionalities:</h1>
                <ul>
                    
                    
                    <li class="controller"><g:link controller="party">Party</g:link></li>
                    <li class="controller"><g:link controller="partyRole">Party Role</g:link></li>
                    <li class="controller"><g:link controller="contactMechanism">Create Contact</g:link></li>
                    <li class="controller"><g:link controller="product">Product</g:link></li>
                    <li class="controller"><g:link controller="productCategory">Product Category</g:link></li>
                    <li class="controller"><g:link controller="productFeature">Product Feature</g:link></li>
                    <li class="controller"><g:link controller="estimatedProductCost">Estimated Product Cost</g:link></li>
                    <li class="controller"><g:link controller="estimatedProductCostType">Estimated Product Cost Type</g:link></li>
                    <li class="controller"><g:link controller="priceComponent">Price Component</g:link></li>
                    <li class="controller"><g:link controller="priceComponentType">Price Component Type</g:link></li>
                    <li class="controller"><g:link controller="productOrder">Order</g:link></li>
                    <li class="controller"><g:link controller="orderItem">Order Item</g:link></li>
                    <li class="controller"><g:link controller="shipment">Shipment</g:link></li>
                    <li class="controller"><g:link controller="shipmentType">ShipmentType</g:link></li>
                    <li class="controller"><g:link controller="shipmentItem">Shipment Item</g:link></li>
                    <li class="controller"><g:link controller="shipmentStatus">Shipment Status</g:link></li>
                    <li class="controller"><g:link controller="shipmentStatusType">Shipment Status Type</g:link></li>
                    <li class="controller"><g:link controller="billingAccount">Billing Account</g:link></li>
                    <li class="controller"><g:link controller="billingAccountRole">Billing Account Role</g:link></li>
                    <li class="controller"><g:link controller="billingAccountRoleType">Billing Account Role Type</g:link></li>
                    <li class="controller"><g:link controller="orderItemBilling">Order Item  Billing</g:link></li>
                    <li class="controller"><g:link controller="shipmentItemBilling">Shipment Item  Billing</g:link></li>
                    <li class="controller"><g:link controller="invoice">Invoice</g:link></li>
                    <li class="controller"><g:link controller="invoiceItem">Invoice Item</g:link></li>
                    <li class="controller"><g:link controller="invoiceItemType">Invoice Item Type</g:link></li>
                    <li class="controller"><g:link controller="invoiceStatusType">Invoice Status Type</g:link></li>
                    <li class="controller"><g:link controller="invoiceStatus">Invoice Status</g:link></li>
                    <li class="controller"><g:link controller="inventoryItem">Inventory Item</g:link></li>
                    <li class="controller"><g:link controller="reportShipmentStatusData">Report Shipment Status Data</g:link></li>
                    <li class="controller"><g:link controller="shipmentDataAndContactMechanismsReport">Shipment Data And Contact Mechanisms Report</g:link></li>
                    <li class="controller"><g:link controller="invoiceDataReport">Invoice Data Report</g:link></li>
                    <li class="controller"><g:link controller="invoiceItemDataReport">Invoice Item Data Report</g:link></li>
                    <li class="controller"><g:link controller="invoiceStatusDataReport">Invoice Status Data Report</g:link></li>
                    <li class="controller"><g:link controller="paymentMethodType">Payment Method Type</g:link></li>
                    <li class="controller"><g:link controller="payment">Payment</g:link></li>
                    <li class="controller"><g:link controller="invoicePaymentsReport">Invoice Payments Report</g:link></li>
                    <li class="controller"><g:link controller="orderType">Order Type</g:link></li>
                    <li class="controller"><g:link controller="salesAndPurchaseOrderReport">Sales And Purchase Orders Report</g:link></li>
                    
                    
                        <%--<li class="controller"><g:link controller="Product">Create Product</g:link></li>
                        <li class="controller"><g:link controller="Product">Create Product</g:link></li>
                        <li class="controller"><g:link controller="Product">Create Product</g:link></li>--%>
                        
                </ul>
            </div>
        </div>
    </body>
</html>

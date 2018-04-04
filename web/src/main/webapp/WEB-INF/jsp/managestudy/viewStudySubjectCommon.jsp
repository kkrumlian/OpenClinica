<style>
    .subsection {
        margin-top: 25px;
        margin-bottom: 75px;
        font-size: .85rem;
    }
    .subsection-title {
        width: 100%;
    }
    .subsection-title td {
        vertical-align: middle;
    }
    .subsection-title td > * {
        vertical-align: middle;
    }
    .datatable {
        border-bottom: none !important;
        border-collapse: collapse !important;
        margin-top: 2px !important;
    }
    .datatable td {
        border: 1px solid #ccc;
        border-bottom-color: #ccc !important;
    }
    .datatable thead td {
        border-color: white !important;
        border-top-color: #ccc !important;
        background-color: #ccc !important;
        text-align: center;
    }
    .datatable thead td:first-child {
        border-left-color: #ccc !important;
    }
    .datatable thead td:last-child {
        border-right-color: #ccc !important;
    }
    .dataTables_info {
        padding-top: 0.5em !important;
    }
    .dataTables_length {
        padding-top: 0.5em;
        padding-left: 1.5em;
    }
    .dataTables_length > label {
        margin-left: 10px;
    }
    .table_tools, .table_actions {
        vertical-align: middle !important;
    }
    .table_tools > a > input {
        margin-top: 3px !important;
    }
    td.actions {
        padding: 3.4px !important;
        vertical-align: middle;
    }
    td.actions td {
        padding: 3.4px !important;
        border: none;
    }
    td.highlight, .submission:hover {
        background-color: whitesmoke !important;
    }
    .submission.oc-status-removed {
        color: red;
    }
    .form-name {
        display: inline;
        margin-right: 10px;
    }
    .add-new {
        margin: 3px !important;
    }
    .searchbox {
        text-align: right;
    }
    .searchbox input {
        margin-left: 5px;
    }
    .button_search {
        margin-top: 2px !important;
    }
    input[type=button][disabled] {
        visibility: hidden;
    }
    .actions .icon:before {
        content: "\f1234";
    }
    .actions .icon.icon-remove:before {
        content: "\e816";
    }
    .actions .icon.icon-edit:before {
        content: "\f14c";
    }
    .actions .icon.icon-view:before {
        content: "\e813";
    }
    .actions .icon.icon-reassign:before {
        content: "\e92f";
    }
    .actions .icon.icon-restore:before {
        content: "\e817";
    }
    .actions .icon.icon-sign:before {
        content: "\e91a";
    }
    .actions .icon.icon-lock:before {
        content: "\e811";
    }
}
</style>

<div id="commonEvents"></div>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
<script type="text/JavaScript" language="JavaScript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="text/JavaScript" language="JavaScript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/JavaScript" language="JavaScript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/JavaScript" language="JavaScript" src="//cdn.datatables.net/plug-ins/1.10.16/sorting/datetime-moment.js"></script>
<script>
    Handlebars.registerHelper('truncate', function(s, length) {
        if (!s)
            return '';
        if (s.join)
            s = s.join(', ');
        s = s.trim();
        return s.length < length ? s : s.substring(0, length) + '...';
    });
</script>
<script id="section-tmpl" type="text/x-handlebars-template">
    <div class="section expanded" id="common.{{studyEventOid}}">
        <div class="section-header">
            {{sectionName}}
        </div>
        <div class="section-body">
            {{#each forms as |form|}}
                <div class="subsection" id="common.{{../studyEventOid}}.{{form.[@OID]}}">
                    <table class="subsection-title">
                    <tr>
                        <td>
                            <h3 class="form-name">{{form.[@Name]}}</h3>
                            <input type="button" class="add-new" value="Add New" 
                                data-form-oid="{{form.[@OID]}}" 
                                data-study-event-oid="{{../studyEventOid}}"
                                {{#if form.disableAddNew}}disabled="disabled"{{/if}}>
                        </td>
                        <td class="searchbox"></td>
                    <tr>
                    </table>
                    <table class="datatable">
                    <thead>
                        <tr>
                            {{#each form.columnTitles as |coltitle|}}
                                <td>{{truncate coltitle 30}}</td>
                            {{/each}}
                            <td>Status</td>
                            <td>Last Updated</td>
                            <td>Updated By</td>
                            <td>Actions</td>
                            <td>oc-status-hide</td>
                        </tr>
                    </thead>
                    <tbody>
                        {{#each form.submissions as |submission|}}
                            <tr class="submission {{submission.hideStatus}}">
                                {{#each submission.data as |data|}}
                                    <td data-search="{{data}}">{{truncate data 200}}</td>
                                {{/each}}
                                <td>{{submission.studyStatus}}</td>
                                <td>{{submission.updatedDate}}</td>
                                <td>{{submission.updatedBy}}</td>
                                <td class="actions">
                                    <table>
                                        <tbody>
                                            <tr>
                                                {{#each submission.links as |link|}}
                                                <td>
                                                    <a href="${pageContext.request.contextPath}{{link.[@href]}}">
                                                        <span class="icon icon-{{link.[@rel]}}" alt="{{link.[@rel]}}" title="{{link.[@rel]}}"></span>
                                                    </a>
                                                </td>
                                                {{/each}}
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td>{{submission.hideStatus}}</td>
                            </tr>
                        {{/each}}
                    </tbody>
                    </table>
                </div>
            {{/each}}
        </div>
    </div>
</script>

<script>
$(function() {
    function collection(x) {
        if (x)
            return x.length ? x : [x];
        return [];
    }

    var odm;
    var pageJson = {
        name: "view subject",
        components: [{ 
            name: "SE_HEALTHCAREENCOUNTERS.F_OUTPATIENTEN",
            type: "table",
            columns: [
              "I_OUTPA_VISIT_DATE"
            ]
        }, { 
            name: "SE_EVENT1.F_MEDS",
            type: "table",
            columns: [
              "I_CON1",
              "I_CON2"
            ]
        }, { 
            name: "SE_EVENT2.F_MEDICATIONS",
            type: "table",
            columns: [
              "I_MEDIC_STARTDT",
              "I_MEDIC_MEDOTHER",
              "I_MEDIC_MEDNAME"
            ]
        }]
    };
    
    $.when(
        $.get('rest/clinicaldata/json/view/${study.oid}/${studySub.oid}/*/*?showArchived=y', function(data){odm = data;})
        // ,
        // $.get('that page.json', function(data){pageJson = data;})
    ).then(function() {
        var columns = {};
        collection(pageJson.components).forEach(function(component) {
            columns[component.name] = component.columns;
        });

        var numVisitBaseds = 0;
        var studyOid = odm.ClinicalData['@StudyOID'];
        var studySubjectOid = odm.ClinicalData.SubjectData['@SubjectKey'];

        var studyEvents = {};
        var forms = {};
        var itemGroups = {};
        var items = {};

        var metadata;
        for (var i=0, studies=collection(odm.Study); i<studies.length; i++) {
            if (studies[i]['@OID'] === '${study.oid}') {
                metadata = studies[i].MetaDataVersion;
                break;
            }
        }        
        collection(metadata.ItemDef).forEach(function(item) {
            items[item['@OID']] = item;
        });
        collection(metadata.ItemGroupDef).forEach(function(itemGroup) {
            itemGroup.items = itemGroup.ItemRef.map(function(ref) {
                return items[ref['@ItemOID']];
            });
            itemGroups[itemGroup['@OID']] = itemGroup;
        });
        collection(metadata.FormDef).forEach(function(form) {
            collection(form.ItemGroupRef).forEach(function(ref) {
                var id = ref['@ItemGroupOID'];
                var itemGroup = itemGroups[id];
            });
            form.submissions = [];
            form.columns = [];
            forms[form['@OID']] = form;
        });
        collection(metadata.StudyEventDef).forEach(function(studyEvent) {
            studyEvent.forms = collection(studyEvent.FormRef).filter(function(ref) {
                return ref['OpenClinica:ConfigurationParameters']['@HideCRF'] === 'No';
            }).map(function(ref) {
                var form = forms[ref['@FormOID']];
                form.disableAddNew = false;
                return form;
            });
            studyEvents[studyEvent['@OID']] = studyEvent;
        });

        collection(odm.ClinicalData.SubjectData.StudyEventData).forEach(function(studyEventData) {
            var formData = studyEventData.FormData;
            if (!formData)
                return;

            var formOid = formData['@FormOID'];
            var form = forms[formOid];
            if (!form)
                return;

            var studyEventOid = studyEventData['@StudyEventOID'];
            var studyEvent = studyEvents[studyEventOid];
            if (studyEvent['@OpenClinica:EventType'] !== 'Common')
                return;

            if (studyEvent['@Repeating'] === 'No')
                form.disableAddNew = true;

            var links = [];
            $.merge(links, collection(studyEventData['OpenClinica:links']['OpenClinica:link']));
            $.merge(links, collection(formData['OpenClinica:links']['OpenClinica:link']));
            var order = ['edit', 'view', 'remove', 'restore', 'reassign', 'sign', 'lock'];
            links.sort(function(a, b) {
                return order.indexOf(a['@rel']) - order.indexOf(b['@rel']);
            });

            var componentOid = studyEventOid + '.' + formOid;
            var columnTitles = [];
            var submissionObj = {};
            console.log("componentOid: " + componentOid);
            console.log("columns:" + columns);
            collection(columns[componentOid]).forEach(function(col) {
                var item = items[col];
                console.log("item:" + item);
                if (item) {
                    columnTitles.push(item.Question.TranslatedText);
                    submissionObj[col] = [];
                }
            });

            var submission = {
                studyStatus: studyEventData['@OpenClinica:Status'],
                formStatus: formData['@OpenClinica:Status'],
                hideStatus: formData['@OpenClinica:Status'] === 'invalid' ? 'oc-status-removed' : 'oc-status-active',
                updatedDate: formData['@OpenClinica:UpdatedDate'].split(' ')[0],
                updatedBy: formData['@OpenClinica:UpdatedBy'],
                data: submissionObj,
                links: links
            };
            collection(formData.ItemGroupData).forEach(function(igd) {
                collection(igd.ItemData).forEach(function(item) {
                    var data = submission.data[item['@ItemOID']];
                    if (data)
                        data.push(item['@Value']);
                });
            });
            form.submissions.push(submission);
            form.columnTitles = columnTitles;
        });

        var hideClass = 'oc-status-removed';
        $.fn.DataTable.ext.search.push(
           function(settings, data, dataIndex) {
              return data[data.length-1] !== hideClass;
           }
        );
        $('#oc-status-hide').on('change', function() {
            hideClass = $(this).val();
            var sections = $('tr.section-header');
            var hides = sections.filter('.' + hideClass);
            hides.hide();
            sections.not(hides).show();
            $('table.datatable').DataTable().draw();
            $('tr.section-header, tr.section-body').removeClass('expanded').addClass('collapsed');
        });

        var hideStatus = $('#oc-status-hide').val();
        var sectionTable = $('#commonEvents');
        var sectionTmpl = Handlebars.compile($('#section-tmpl').html());
        for (var studyEventId in studyEvents) {
            var studyEvent = studyEvents[studyEventId];
            if (studyEvent['@OpenClinica:EventType'] === 'Common') {
                var status = studyEvent['@OpenClinica:Status'] === 'AVAILABLE' ? 'oc-status-active' : 'oc-status-removed';
                var display = status === hideStatus ? 'display:none;' : '';
                sectionTable.append(sectionTmpl({
                    sectionName: studyEvent['@Name'],
                    sectionStatus: status,
                    sectionDisplay: display,
                    studyEventOid: studyEventId,
                    forms: studyEvent.forms
                }));
            }
            else {
                numVisitBaseds++;
            }
        }
        sectionTable.on('click', '.section-header', function() {
            $(this).next().addBack().toggleClass('collapsed expanded');
        });
        sectionTable.on('click', '.add-new', function() {
            var btn = $(this);
            var formOid = btn.data('form-oid');
            var studyEventOid = btn.data('study-event-oid');
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/pages/api/addAnotherForm',
                cache: false,
                data: {
                    studyoid: studyOid,
                    studyeventdefinitionoid: studyEventOid,
                    studysubjectoid: studySubjectOid,
                    crfoid: formOid
                },
                success: function(obj) {
                    window.location.href = '${pageContext.request.contextPath}' + obj.url;
                },
                error: function(e) {
                    alert('Error. See console log.');
                    console.log(e);
                }
            });
        });

        if (numVisitBaseds) {
            $('#subjectEvents').removeClass('hide');
        }

        $.fn.dataTable.moment('DD-MMM-YYYY');
        $('table.datatable')
            .each(function() {
                var table = $(this).DataTable({
                    dom: "frtilp",
                    language: {
                        paginate: {
                            first: '<<',
                            previous: '<',
                            next: '>',
                            last: '>>'
                        },
                        info: 'Results _START_-_END_ of _TOTAL_.',
                        infoEmpty: 'Results 0-0 of 0.',
                        infoFiltered: '(filtered from _MAX_ total)',
                        lengthMenu: 'Show _MENU_ per page'
                    },
                    columnDefs: [{
                        targets: -1,
                        visible: false
                    }]
                });
                $(this).children('tbody').on('mouseenter', 'td', function () {
                    var colIdx = table.cell(this).index().column;
                    $(table.cells().nodes()).removeClass('highlight');
                    $(table.column(colIdx).nodes()).addClass('highlight');
                });
            })
            .prev('.dataTables_filter').each(function() {
                var searchbox = $(this);
                searchbox.appendTo(searchbox.closest('.subsection').find('.searchbox'));
            })
            .end()
            .wrap($('<div>', {
                css: {
                    'max-width': $(window).width() - 200,
                    overflow: 'scroll'
                }
            }));

        $('#loading').remove();
    });
});
</script>

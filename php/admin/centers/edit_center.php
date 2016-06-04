<?php 

	require_once "check_authenticated.php";	

?>

<?php
    /**
    * Populates a popup dialog with information about the chosen center
    */

    require_once "../../common/dbConnect.php";
    require_once "../../common/class.map.php";

    $map = new Map();
    $cid = -1;
    if (isset($_POST['cid']))
        $cid = intval($_POST['cid']);

    $center = $map -> load_center($cid);
?>

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Add/Edit Center</h4>
        </div>
        <div class="modal-body">
            <div id="invalidInputWarning"></div>
            <div class="form-group" id="nameGroup">
                <label>Name: </label>
                <input type="text" class="form-control" id="name" name="name" value=<?php echo '"' . $center['name'] . '"'; ?>>
            </div>
            <div class="form-group" id="acronymGroup">
                <label>Acronym: </label>
                <input type="text" class="form-control" id="acronym" name="acronym" value=<?php echo '"' . $center['acronym'] . '"'; ?>>
            </div>
            <label>Color: </label>
            <div id="cp" class="input-group colorpicker-component">
            <span class="input-group-addon"><i></i></span>
            <input type="text" id="color" value=<?php echo '"' . $center['color'] . '"'; ?> class="form-control" /> 
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick=submitEditCenter(<?php echo $cid; ?>)>Save changes</button>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

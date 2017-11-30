$(document).ready(function() {
	$('#add_part_but').click(function() {
		var selectedPart = $('#select_part').val();
		var selectedPartName = $('#select_part option:selected').text();
		var partCell = $(document.createElement('td'));
		var partNameCell = $(document.createElement('td'));
		var numberCell = $(document.createElement('td'));
		var deleteCell = $(document.createElement('td'));
		var row = $(document.createElement('tr'));
		var isExist = false;
		$("#part_table > tbody > tr").each(function() {
			var tmp = $(this).children("td:first-child").text();
			if(tmp == selectedPart) {
				isExist = true;
				return false;
			}
		});
		if(isExist) {
			return;
		}
		partCell.text(selectedPart);
		partNameCell.text(selectedPartName);
		numberCell.html('<input type="number" value="1" min="1" />');
		deleteCell.html('<span class="material-icons">delete</span>');
		row.append(partCell, partNameCell, numberCell, deleteCell);
		$('#part_table').find('tbody').append(row);
	});
	$(document).on('click', '.material-icons', function() {
		$(this).closest('tr').remove();
	});
});

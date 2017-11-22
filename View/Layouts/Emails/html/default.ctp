<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Hookipa</title>
	</head>

	<body>
		<table width="707" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<!-- <td bgcolor="#FFFFFF"><?//= $this->Html->image('emails/email-top.jpg', array('fullBase' => true)); ?></td> -->
				<td bgcolor="#FFFFFF"><img src="http://www.hookipa.cl/img/emails/email-top.jpg" alt=""/></td>
			</tr>
			<?= $this->fetch('content'); ?>
			<tr>
				<!-- <td><?//= $this->Html->image('emails/email-footer-minimal.jpg', array('fullBase' => true)); ?></td> -->
				<td><img src="http://www.hookipa.cl/img/emails/email-footer-minimal.jpg" alt=""/></td>
			</tr>
		</table>
	</body>
</html>

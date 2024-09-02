import QtQuick

TasksListForm {

    hideTasks.onTapped: {
        if (taskList.opacity) {
            hideAnim.start()
        } else {
            showAnim.start()
        }
    }

    onTaskDataChanged: dialogPopup.open()

    dialogPopup.onAccepted: {
        Database.deleteTask(taskData.id)
        listModel.remove(taskData.idx)
    }
}

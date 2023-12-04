<?php

function setQueryList($request, $columns)
{

    $key_filter = '';
    $list_column = [];
    $value_filter = [];
    if ($request->filter) {
        $list_filter = explode("|", $request->filter);

        for ($i = 0; $i < count($list_filter); $i++) {
            $item_keyword = explode("=", $list_filter[$i]);
            $key_keyword = $item_keyword[0];
            $list_column = [...$list_column, $key_keyword];
            $value_keyword = $item_keyword[1];
            $keyword = '%' . $value_keyword . '%';
            if ($i == 0) {
                $key_filter = $key_filter . "`$key_keyword` like ?";
                $value_filter = [...$value_filter, $keyword];
            } else {
                $key_filter = $key_filter . " and `$key_keyword` like ?";
                $value_filter = [...$value_filter, $keyword];
            }
        };
    }

    $fromDate = $request->query('from');
    $toDate = $request->query('to');

    $isSearchDateRange = !empty($fromDate) &&
        !is_null($fromDate) && $fromDate && !empty($toDate) &&
        !is_null($toDate) && $toDate;

    $fromDateTime = $fromDate . " 00:00:00";
    $toDateTime = $toDate . " 23:59:59";

    $list_key = "";

    if ($request->filter && $request->search) {
        $list_key = $isSearchDateRange ? " (" . $key_filter . " and " . "created_at >= ?" . " and " . "created_at <= ?" . " ) " : " (" . $key_filter . " ) ";
    }

    if ($request->filter && !$request->search) {
        $list_key = $isSearchDateRange ? " (" . $key_filter . " and " . "created_at >= ?" . " and " . "created_at <= ?" . " ) " : " (" . $key_filter . " ) ";
    }

    if (!$request->filter && $request->search) {
        $list_key = $isSearchDateRange ? " (" . "created_at >= ?" . " and " . "created_at <= ?" . " ) " : "";
    }

    if (!$request->filter && !$request->search) {
        $list_key = $isSearchDateRange ? " (" . " created_at >= ?" . " and " . "created_at <= ?" . " ) " : "";
    }

    $list_val = $isSearchDateRange ? [...$value_filter, $fromDateTime, $toDateTime] : [...$value_filter];

    $queryKey = strlen($list_key) > 0 ? $list_key : " (`id` like ? ) ";
    $queryVal = count($list_val) > 0 ? $list_val : ["%%"];

    //searching
    $key_searching = '';
    $value_searching = [];

    if ($request->search) {
        $keyword = '%' . $request->search . '%';
        for ($i = 0; $i < count($columns); $i++) {
            $column = $columns[$i];
            if ($i == 0) {
                $key_searching = $key_searching . "`$column` like ?";
                $value_searching = [...$value_searching, $keyword];
            } else {
                $key_searching = $key_searching . " or `$column` like ?";
                $value_searching = [...$value_searching, $keyword];
            }
        }
    }

    $querySearchKey = strlen($key_searching) > 0 ? " (" . $key_searching  . " ) " : " (`id` like ? ) ";
    $querySearchVal = count($value_searching) > 0 ? $value_searching : ["%%"];

    return [
        "queryKey" => $queryKey,
        "queryVal" => $queryVal,
        "querySearchKey" => $querySearchKey,
        "querySearchVal" => $querySearchVal,
        "listColumn" => $list_column
    ];
}

function setPagination($data)
{
    $pagination = (object) [
        "current_page" => $data->toArray()["current_page"],
        "first_page_url" => $data->toArray()["first_page_url"],
        "from" => $data->toArray()["from"],
        "last_page" => $data->toArray()["last_page"],
        "last_page_url" => $data->toArray()["last_page_url"],
        "links" => $data->toArray()["links"],
        "next_page_url" => $data->toArray()["next_page_url"],
        "path" => $data->toArray()["path"],
        "per_page" => $data->toArray()["per_page"],
        "prev_page_url" => $data->toArray()["prev_page_url"],
        "to" => $data->toArray()["to"],
        "total" => $data->toArray()["total"]
    ];

    return $pagination;
}



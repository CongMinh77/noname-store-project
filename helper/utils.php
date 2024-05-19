<?php

function getPagination($dataRecord, $limit, $currentPage): array
{
    $count = count($dataRecord);
    $number = ceil($count / $limit);

    if ($currentPage > $number || $currentPage < 0 || empty($_GET['page'])) {
        $currentPage = 1;
    }
    $firstIndex = ($currentPage - 1) * $limit;
    return [
        'number' => strval($number),
        'firstIndex' => strval($firstIndex),
        'page' => $currentPage
    ];
}

function removeSpecialCharacter($string) {
    return preg_replace('/[^A-Za-z0-9\-]/', '', $string);
}
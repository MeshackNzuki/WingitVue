<?php

namespace App\Http\Controllers;

abstract class Controller
{
    protected function CusRes($data = [], $message = '', $statusCode = Response::HTTP_OK)
    {
        $response = [
            'success' => true,
            'data' => $data,
            'message' => $message,
        ];

        if (empty($data) && empty($message)) {            
            $response['success'] = false;
            $response['message'] = 'Error occurred.';
            $statusCode = Response::HTTP_BAD_REQUEST;
        }

        return response()->json($response, $statusCode);
    }
}

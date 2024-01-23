<?php

namespace App\Traits;

use Symfony\Component\HttpFoundation\JsonResponse;

trait HttpResponses
{
    protected function success($message = null, $token = null, $code = 200): JsonResponse
    {
        return response()->json([
            'status' => true,
            'message' => $message,
            'token' => $token,
        ], $code);
    }

    protected function error($message = null, $errors = null, $code): JsonResponse
    {
        return response()->json([
            'status' => false,
            'message' => $message,
            'errors' => $errors
        ], $code);
    }
}

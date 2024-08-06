<?php

namespace App\Http\Controllers\Level;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Level\Level;
use App\Models\Level\Stream;

class LevelStreamController extends Controller
{
    use ResSuccess;

    public function getLevels()
    {
        $levels = Level::all();
        return $this->ResSuccess($levels);
    }

    public function getStreams()
    {
        $streams = Stream::all();
        return $this->ResSuccess($streams);
    }

    public function addLevel(Request $request)
    {
        $validated = $request->validate([
            'level' => 'required|integer',
            'description' => 'nullable|string',
        ]);

        $level = Level::create($validated);
        return $this->ResSuccess($level, 'Level added successfully', 201);
    }

    public function addStream(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'description' => 'nullable|string',
        ]);

        $stream = Stream::create($validated);
        return $this->ResSuccess($stream, 'Stream added successfully', 201);
    }
}

@if(isset($options->relationship))
    {{-- If this is a relationship and the method does not exist, show a warning message --}}
    @if( !method_exists( $dataType->model_name, \Illuminate\Support\Str::camel($row->field) ) )
        <p class="label label-warning"><i class="voyager-warning"></i> {{ __('voyager::form.field_select_dd_relationship', ['method' => \Illuminate\Support\Str::camel($row->field).'()', 'class' => $dataType->model_name]) }}</p>
    @endif

    @if( method_exists( $dataType->model_name, \Illuminate\Support\Str::camel($row->field) ) )
        @if(isset($dataTypeContent->{$row->field}) && !is_null(old($row->field, $dataTypeContent->{$row->field})))
            <?php $selected_value = old($row->field, $dataTypeContent->{$row->field}); ?>
        @else
            <?php $selected_value = old($row->field); ?>
        @endif

        <select class="form-control select2" name="{{ $row->field }}">
            <?php $default = (isset($options->default) && !isset($dataTypeContent->{$row->field})) ? $options->default : null; ?>

            @if(isset($options->options))
                <optgroup label="{{ __('voyager::generic.custom') }}">
                @foreach($options->options as $key => $option)
                    <option value="{{ ($key == '_empty_' ? '' : $key) }}" @if($default == $key && $selected_value === NULL) selected="selected" @endif @if((string)$selected_value == (string)$key) selected="selected" @endif>{{ $option }}</option>
                @endforeach
                </optgroup>
            @endif
            {{-- Populate all options from relationship --}}
            <?php
            $relationshipListMethod = \Illuminate\Support\Str::camel($row->field) . 'List';
            if (method_exists($dataTypeContent, $relationshipListMethod)) {
                $relationshipOptions = $dataTypeContent->$relationshipListMethod();
            } else {
                $relationshipClass = $dataTypeContent->{\Illuminate\Support\Str::camel($row->field)}()->getRelated();
                if (isset($options->relationship->where)) {
                    $relationshipOptions = $relationshipClass::where(
                        $options->relationship->where[0],
                        $options->relationship->where[1]
                    )->get();
                } else {
                    $relationshipOptions = $relationshipClass::all();
                }
            }

            // Try to get default value for the relationship
            // when default is a callable function (ClassName@methodName)
            if ($default != null) {
                $comps = explode('@', $default);
                if (count($comps) == 2 && method_exists($comps[0], $comps[1])) {
                    $default = call_user_func([$comps[0], $comps[1]]);
                }
            }
            ?>

            <optgroup label="{{ __('voyager::database.relationship.relationship') }}">
            @foreach($relationshipOptions as $relationshipOption)
                <option value="{{ $relationshipOption->{$options->relationship->key} }}" @if($default == $relationshipOption->{$options->relationship->key} && $selected_value === NULL) selected="selected" @endif @if($selected_value == $relationshipOption->{$options->relationship->key}) selected="selected" @endif>{{ $relationshipOption->{$options->relationship->label} }}</option>
            @endforeach
            </optgroup>
        </select>
    @else
        <select class="form-control select2" name="{{ $row->field }}"></select>
    @endif
@else
<?php 
// Create an empty stdClass object
// $myObject = new stdClass();

// // Add properties to the object
// $myObject->view_edit = "periodiciteField";
// $myObject->default = "three";

// // Create an options object and add properties to it
// $options = new stdClass();
// $options->one = "1 mois";
// $options->two = "2 mois";
// $options->three = "3 mois";

// // Assign the options object to the main object
// $myObject->options = $options;
//echo "<pre>"; var_dump($dataType->name);die;

$montant = DB::table($dataType->name)->where('id',$dataTypeContent->id)->get()->first()->montant;
$limit = App\Services\Periodicite::getPeriodicite($montant);

?>
    <?php $selected_value = (isset($dataTypeContent->{$row->field}) && !is_null(old($row->field, $dataTypeContent->{$row->field}))) ? old($row->field, $dataTypeContent->{$row->field}) : old($row->field); ?>
    <select class="form-control select2" name="{{ $row->field }}">
        <?php $default = (isset($options->default) && !isset($dataTypeContent->{$row->field})) ? $options->default : null; ?>
        @if(isset($options->options))
            @foreach($options->options as $key => $option)
            <option value="{{ $key }}" @if($default == $key && $selected_value === NULL) selected="selected" @endif @if($selected_value == $key) selected="selected" @endif>{{ $option }}</option>
            @if($key === $limit){
                @break;
            }
            @endif
            @endforeach
        @endif
    </select>
@endif

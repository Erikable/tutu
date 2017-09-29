require 'test_helper'

class RailwayStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @railway_station = railway_stations(:one)
  end

  test "should get index" do
    get railway_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_railway_station_url
    assert_response :success
  end

  test "should create railway_station" do
    assert_difference('RailwayStation.count') do
      post railway_stations_url, params: { railway_station: {  } }
    end

    assert_redirected_to railway_station_url(RailwayStation.last)
  end

  test "should show railway_station" do
    get railway_station_url(@railway_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_railway_station_url(@railway_station)
    assert_response :success
  end

  test "should update railway_station" do
    patch railway_station_url(@railway_station), params: { railway_station: {  } }
    assert_redirected_to railway_station_url(@railway_station)
  end

  test "should destroy railway_station" do
    assert_difference('RailwayStation.count', -1) do
      delete railway_station_url(@railway_station)
    end

    assert_redirected_to railway_stations_url
  end
end

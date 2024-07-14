package groupId;

import java.sql.SQLException;

import static com.example.AirlineQueries.*;// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public static void main(String[] args) {
    try {
        System.out.println("Total number of flights: " + getTotalNumberOfFlights());
        System.out.println("Average flight distance: " + getAverageFlightDistance());
        System.out.println("Average number of seats: " + getAverageNumberOfSeats());
        getAverageMilesFlownByCustomerStatus();
        getMaxMilesFlownByCustomerStatus();
        System.out.println("Total number of Boeing aircraft: " + getTotalNumberOfBoeingAircraft());
        getFlightsBetweenDistance(300, 2000);
        getAverageFlightDistanceByCustomerStatus();
        getMostOftenBookedAircraftByGoldMembers();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

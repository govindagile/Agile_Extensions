//
//  Extension_NSDate.swift
//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//


import Foundation


extension String {
    
    
    /// Get time in 24 hour format
    var getTimeIn24Format: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = dateFormatter.date(from: self)
        return (date?.hourTwoDigit24Hours)!
    }
    
    /// Get time in 12 hour format
    var getTimeIn12Format : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = dateFormatter.date(from: self)
        return (date?.hourTwoDigit)!
    }
    
    /// Get time from date
    var getDateFromString: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let date = dateFormatter.date(from: self)
        return date!
    }
}

public extension Date {
    
    /// User’s current calendar.
    public var calendar: Calendar {
        return Calendar.current
    }
    
    /// Era.
    public var era: Int {
        return calendar.component(.era, from: self)
    }
    
    /// Year.
    public var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: newValue, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Quarter.
    public var quarter: Int {
        return calendar.component(.quarter, from: self)
    }
    
    /// Month.
    public var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: newValue, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Week of year.
    public var weekOfYear: Int {
        return calendar.component(.weekOfYear, from: self)
    }
    
    /// Week of month.
    public var weekOfMonth: Int {
        return calendar.component(.weekOfMonth, from: self)
    }
    
    /// Weekday.
    public var weekday: Int {
        return calendar.component(.weekday, from: self)
    }
    
    /// Day.
    public var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: newValue, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Hour.
    public var hour: Int {
        get {
            return calendar.component(.hour, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: newValue, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Minutes.
    public var minute: Int {
        get {
            return calendar.component(.minute, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: hour, minute: newValue, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Seconds.
    public var second: Int {
        get {
            return calendar.component(.second, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: hour, minute: minute, second: newValue, nanosecond: nanosecond)
        }
    }
    
    /// Nanoseconds.
    public var nanosecond: Int {
        return calendar.component(.nanosecond, from: self)
    }
    
    /// Check if date is in future.
    public var isInFuture: Bool {
        return self > Date()
    }
    
    /// Check if date is in past.
    public var isInPast: Bool {
        return self < Date()
    }
    
    /// Check if date is in today.
    public var isInToday: Bool {
        return self.day == Date().day && self.month == Date().month && self.year == Date().year
    }
    
    /// ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSS) from date.
    public var iso8601String: String {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return dateFormatter.string(from: self).appending("Z")
    }
    
    /// Nearest five minutes to date.
    public var nearestFiveMinutes: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self)
        guard let min = components.minute else {
            return self
        }
        components.minute! = min % 5 < 3 ? min - min % 5 : min + 5 - (min % 5)
        components.second = 0
        if min > 57 {
            components.hour? += 1
        }
        return Calendar.current.date(from: components) ?? Date()
    }
    
    /// Nearest ten minutes to date.
    public var nearestTenMinutes: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self)
        guard let min = components.minute else {
            return self
        }
        components.minute! = min % 10 < 6 ? min - min % 10 : min + 10 - (min % 10)
        components.second = 0
        if min > 55 {
            components.hour? += 1
        }
        return Calendar.current.date(from: components) ?? Date()
    }
    
    /// Nearest quarter to date.
    public var nearestHourQuarter: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self)
        guard let min = components.minute else {
            return self
        }
        components.minute! = min % 15 < 8 ? min - min % 15 : min + 15 - (min % 15)
        components.second = 0
        if min > 52 {
            components.hour? += 1
        }
        return Calendar.current.date(from: components) ?? Date()
    }
    
    /// Nearest half hour to date.
    public var nearestHalfHour: Date {
        var components = Calendar.current.dateComponents([.year, .month , .day , .hour , .minute], from: self)
        guard let min = components.minute else {
            return self
        }
        components.minute! = min % 30 < 15 ? min - min % 30 : min + 30 - (min % 30)
        components.second = 0
        if min > 30 {
            components.hour? += 1
        }
        return Calendar.current.date(from: components) ?? Date()
    }
    
    /// Time zone used by system.
    public var timeZone: TimeZone {
        return self.calendar.timeZone
    }
    
    /// UNIX timestamp from date.
    public var unixTimestamp: Double {
        return timeIntervalSince1970
    }
    
}

// MARK: - Methods
public extension Date {
    
    /// Add calendar component to date.
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: multiples of compnenet to add.
    public mutating func add(_ component: Calendar.Component, value: Int) {
        switch component {
        case .second:
            self = calendar.date(byAdding: .second, value: value, to: self) ?? self
            break
            
        case .minute:
            self = calendar.date(byAdding: .minute, value: value, to: self) ?? self
            break
            
        case .hour:
            self = calendar.date(byAdding: .hour, value: value, to: self) ?? self
            break
            
        case .day:
            self = calendar.date(byAdding: .day, value: value, to: self) ?? self
            break
            
        case .weekOfYear, .weekOfMonth:
            self = calendar.date(byAdding: .day, value: value * 7, to: self) ?? self
            break
            
        case .month:
            self = calendar.date(byAdding: .month, value: value, to: self) ?? self
            break
            
        case .year:
            self = calendar.date(byAdding: .year, value: value, to: self) ?? self
            break
            
        default:
            break
        }
    }
    
    /// Date by adding multiples of calendar component.
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: multiples of compnenets to add.
    /// - Returns: original date + multiples of compnenet added.
    public func adding(_ component: Calendar.Component, value: Int) -> Date {
        switch component {
        case .second:
            return calendar.date(byAdding: .second, value: value, to: self) ?? self
            
        case .minute:
            return calendar.date(byAdding: .minute, value: value, to: self) ?? self
            
        case .hour:
            return calendar.date(byAdding: .hour, value: value, to: self) ?? self
            
        case .day:
            return calendar.date(byAdding: .day, value: value, to: self) ?? self
            
        case .weekOfYear, .weekOfMonth:
            return calendar.date(byAdding: .day, value: value * 7, to: self) ?? self
            
        case .month:
            return calendar.date(byAdding: .month, value: value, to: self) ?? self
            
        case .year:
            return calendar.date(byAdding: .year, value: value, to: self) ?? self
            
        default:
            return self
        }
    }
    
    /// Date by changing value of calendar component.
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: new value of compnenet to change.
    /// - Returns: original date + multiples of compnenets added.
    public func changing(_ component: Calendar.Component, value: Int) -> Date {
        switch component {
        case .second:
            var date = self
            date.second = value
            return date
            
        case .minute:
            var date = self
            date.minute = value
            return date
            
        case .hour:
            var date = self
            date.hour = value
            return date
            
        case .day:
            var date = self
            date.day = value
            return date
            
        case .month:
            var date = self
            date.month = value
            return date
            
        case .year:
            var date = self
            date.year = value
            return date
            
        default:
            return self
        }
    }
    
    /// Data at the beginning of calendar component.
    ///
    /// - Parameter component: calendar component to get date at the beginning of.
    /// - Returns: date at the beginning of calendar component (if applicable).
    public func beginning(of component: Calendar.Component) -> Date? {
        switch component {
        case .second:
            return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self))
            
        case .minute:
            return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self))
            
        case .hour:
            return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour], from: self))
            
        case .day:
            return self.calendar.startOfDay(for: self)
            
        case .weekOfYear, .weekOfMonth:
            return calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
            
        case .month:
            return calendar.date(from: calendar.dateComponents([.year, .month], from: self))
            
        case .year:
            return calendar.date(from: calendar.dateComponents([.year], from: self))
            
        default:
            return nil
        }
    }
    
    /// Date at the end of calendar component.
    ///
    /// - Parameter component: calendar component to get date at the end of.
    /// - Returns: date at the end of calendar component (if applicable).
    public func end(of component: Calendar.Component) -> Date? {
        switch component {
        case .second:
            var date = self.adding(.second, value: 1)
            guard let after = calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)) else {
                return nil
            }
            date = after
            date.add(.second, value: -1)
            return date
            
        case .minute:
            var date = self.adding(.minute, value: 1)
            guard let after = calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)) else {
                return nil
            }
            date = after.adding(.second, value: -1)
            return date
            
        case .hour:
            var date = self.adding(.hour, value: 1)
            guard let after = calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour], from: self)) else {
                return nil
            }
            date = after.adding(.second, value: -1)
            return date
            
        case .day:
            var date = self.adding(.day, value: 1)
            date = date.calendar.startOfDay(for: date)
            date.add(.second, value: -1)
            return date
            
        case .weekOfYear, .weekOfMonth:
            var date = self
            guard let beginningOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else {
                return nil
            }
            date = beginningOfWeek.adding(.day, value: 7).adding(.second, value: -1)
            return date
            
        case .month:
            var date = self.adding(.month, value: 1)
            guard let after = calendar.date(from: calendar.dateComponents([.year, .month], from: self)) else {
                return nil
            }
            date = after.adding(.second, value: -1)
            return date
            
        case .year:
            var date = self.adding(.year, value: 1)
            guard let after = calendar.date(from: calendar.dateComponents([.year], from: self)) else {
                return nil
            }
            date = after.adding(.second, value: -1)
            return date
            
        default:
            return nil
        }
    }
    
    /// Date string from date.
    ///
    /// - Parameter style: DateFormatter style (default is .medium)
    /// - Returns: date string
    func dateString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    /// Date and time string from date.
    ///
    /// - Parameter style: DateFormatter style (default is .medium)
    /// - Returns: date and time string
    public func dateTimeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    /// Check if date is in current given calendar component.
    ///
    /// - Parameter component: calendar componenet to check.
    /// - Returns: true if date is in current given calendar component.
    public func isInCurrent(_ component: Calendar.Component) -> Bool {
        switch component {
        case .second:
            return second == Date().second && minute == Date().minute && hour == Date().hour && day == Date().day
                && month == Date().month && year == Date().year && era == Date().era
            
        case .minute:
            return minute == Date().minute && hour == Date().hour && day == Date().day && month == Date().month
                && year == Date().year && era == Date().era
            
        case .hour:
            return hour == Date().hour && day == Date().day && month == Date().month && year == Date().year
                && era == Date().era
            
        case .day:
            return day == Date().day && month == Date().month && year == Date().year && era == Date().era
            
        case .weekOfYear, .weekOfMonth:
            let beginningOfWeek = Date().beginning(of: .weekOfMonth)!
            let endOfWeek = Date().end(of: .weekOfMonth)!
            return self >= beginningOfWeek && self <= endOfWeek
            
        case .month:
            return month == Date().month && year == Date().year && era == Date().era
            
        case .year:
            return year == Date().year && era == Date().era
            
        case .era:
            return era == Date().era
            
        default:
            return false
        }
    }
    
    /// Time string from date
    public func timeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = .none
        return dateFormatter.string(from: self)
    }
    
}


// MARK: - Initializers
public extension Date {
    
    /// Create a new date form calendar components.
    ///
    /// - Parameters:
    ///   - calendar: Calendar (default is current).
    ///   - timeZone: TimeZone (default is current).
    ///   - era: Era (default is current era).
    ///   - year: Year (default is current year).
    ///   - month: Month (default is current month).
    ///   - day: Day (default is today).
    ///   - hour: Hour (default is current hour).
    ///   - minute: Minute (default is current minute).
    ///   - second: Second (default is current second).
    ///   - nanosecond: Nanosecond (default is current nanosecond).
    public init(
        calendar: Calendar? = Calendar.current,
        timeZone: TimeZone? = TimeZone.current,
        era: Int? = Date().era,
        year: Int? = Date().year,
        month: Int? = Date().month,
        day: Int? = Date().day,
        hour: Int? = Date().hour,
        minute: Int? = Date().minute,
        second: Int? = Date().second,
        nanosecond: Int? = Date().nanosecond) {
        
        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.era = era
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        
        self = calendar?.date(from: components) ?? Date()
    }
    
    /// Create date object from ISO8601 string.
    ///
    /// - Parameter iso8601String: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSSZ).
    public init(iso8601String: String) {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self = dateFormatter.date(from: iso8601String) ?? Date()
    }
    
    /// Create new date object from UNIX timestamp.
    ///
    /// - Parameter unixTimestamp: UNIX timestamp.
    public init(unixTimestamp: Double) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }
    
}

public extension Date {
    /// SwiftRandom extension
    public static func randomWithinDaysBeforeToday(_ days: Int) -> Date {
        let today = Date()
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let r1 = arc4random_uniform(UInt32(days))
        let r2 = arc4random_uniform(UInt32(23))
        let r3 = arc4random_uniform(UInt32(59))
        let r4 = arc4random_uniform(UInt32(59))
        
        var offsetComponents = DateComponents()
        offsetComponents.day = Int(r1) * -1
        offsetComponents.hour = Int(r2)
        offsetComponents.minute = Int(r3)
        offsetComponents.second = Int(r4)
        
        guard let rndDate1 = gregorian.date(byAdding: offsetComponents, to: today) else {
            print("randoming failed")
            return today
        }
        return rndDate1
    }
    
    /// SwiftRandom extension
    public static func random() -> Date {
        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
        return Date(timeIntervalSince1970: randomTime)
    }
    
}



public extension Date {
	
	// MARK:- APP SPECIFIC FORMATS
	
    
    /// Retuen Date from string.
    ///
    /// - Parameters:
    ///   - strDate: formated string date.
    ///   - format: new formate.
    /// - Returns: new date from formate.
	public func app_dateFromString(strDate:String, format:String) -> Date? {
		
		let dateFormatter:DateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		if let dtDate = dateFormatter.date(from: strDate){
			return dtDate as Date?
		}
		return nil
	}
	
	
    /// Return Date in string formate.
    ///
    /// - Returns: date in string.
	public func app_stringFromDate() -> String{
		let dateFormatter:DateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
		let strdt = dateFormatter.string(from: self as Date)
		if let dtDate = dateFormatter.date(from: strdt){
			return dateFormatter.string(from: dtDate)
		}
		return "--"
	}
	
    /// String for notification.
    ///
    /// - Returns: string from date
	public func app_stringFromDate_notification() -> String{
		return "\(self.monthNameShort) \(self.dayTwoDigit), \(self.yearFourDigit)"
	}

    
    /// Get string from date
    ///
    /// - Parameter localDate: Date for change
    /// - Returns: string of date
	public func getUTCFormateDate(localDate: NSDate) -> String {
		
		let dateFormatter:DateFormatter = DateFormatter()
		let timeZone: NSTimeZone = NSTimeZone(name: "UTC")!
		dateFormatter.timeZone = timeZone as TimeZone!
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
		let dateString: String = dateFormatter.string(from: localDate as Date)
		return dateString
	}
	
	
    /// Merge date and time
    ///
    /// - Parameters:
    ///   - date: your date
    ///   - time: your time
    /// - Returns: merged date and time
	public func combineDateWithTime(date: NSDate, time: NSDate) -> NSDate? {
		
        let calendar = NSCalendar.current
		let dateComponents = calendar.dateComponents([.year, .month, .day], from: date as Date)
		let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time as Date)
		let mergedComponments = NSDateComponents()
		mergedComponments.year = dateComponents.year!
		mergedComponments.month = dateComponents.month!
		mergedComponments.day = dateComponents.day!
		mergedComponments.hour = timeComponents.hour!
		mergedComponments.minute = timeComponents.minute!
		mergedComponments.second = timeComponents.second!
		return calendar.date(from: mergedComponments as DateComponents) as NSDate?
	}
	
    
    /// Get date array between two dates
    ///
    /// - Parameters:
    ///   - startDate: start date
    ///   - endDate: end date
    /// - Returns: dates array
	public func getDatesBetweenDates(startDate:NSDate, andEndDate endDate:NSDate) -> [NSDate] {
		let gregorian: NSCalendar = NSCalendar.current as NSCalendar;
		let components = gregorian.components(NSCalendar.Unit.day, from: startDate as Date, to: endDate as Date, options: [])
		var arrDates = [NSDate]()
		for i in 0...components.day!{
			arrDates.append(startDate.addingTimeInterval(60*60*24*Double(i)))
		}
		return arrDates
	}
	
	
    /// Check date is greater or not
    ///
    /// - Parameter dateToCompare: date for compare
    /// - Returns: Bool(true or false)
	public func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
		//Declare Variables
		var isGreater = false
		
		//Compare Values
		if self.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
			isGreater = true
		}
		
		//Return Result
		return isGreater
	}
	
    
    /// Check date is less or not
    ///
    /// - Parameter dateToCompare: date for compare
    /// - Returns: Bool(true or false)
	public func isLessThanDate(dateToCompare: Date) -> Bool {
		//Declare Variables
		var isLess = false
		
		//Compare Values
		if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
			isLess = true
		}
		
		//Return Result
		return isLess
	}
	
    
    /// Check date is equal or noT
    ///
    /// - Parameter dateToCompare: date for compare
    /// - Returns: Bool(true or false)
	public func equalToDate(dateToCompare: NSDate) -> Bool {
		//Declare Variables
		var isEqualTo = false
		
		//Compare Values
		if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
			isEqualTo = true
		}
		
		//Return Result
		return isEqualTo
	}
    
	
    /// Retuen time with AM,PM  // Ex: 12:30AM
	public var timeWithAMPM: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "h:mma"
		dateFormatter.amSymbol = "am"
		dateFormatter.pmSymbol = "pm"
		return dateFormatter.string(from: self as Date)
	}
	
	
	
	
	// MARK:- YEAR
	
	
    /// Retuen year from date
	public var yearFourDigit_Int: Int {
		return Int(self.yearFourDigit)!
	}
	
    
    /// Return one digit from year // Ex: 2018
	public var yearOneDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "y"
		return dateFormatter.string(from: self as Date)
	}
    
    
    /// Return two digit from year // Ex: 18
	public var yearTwoDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yy"
		return dateFormatter.string(from: self as Date)
	}
    
    
    /// Return four digit from year // Ex: 2018
	public var yearFourDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy "
		return dateFormatter.string(from: self as Date)
	}
	
	
	
	// MARK:- MONTH
	
    
    
    /// Return month in one digit(Int)
	public var monthOneDigit_Int: Int {
		return Int(self.monthOneDigit)!
	}
    
    /// Return month in two digit(Int)
	public var monthTwoDigit_Int: Int {
		return Int(self.monthTwoDigit)!
	}
	
	/// Return month in one digit(string) // 01
	public var monthOneDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "M"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return month in two digit(string) // 1
	public var monthTwoDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM"
		return dateFormatter.string(from: self as Date)
	}
    
	/// Return short name of month // Dec
    public var monthNameShort: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMM"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return full name of month // December
	public var monthNameFull: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMMM"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return first latter of month // December - > D
	public var monthNameFirstLetter: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMMMM"
		return dateFormatter.string(from: self as Date)
	}
	
	// MARK:- DAY
	
    
    /// Return one digit from day // 01
	public var dayOneDigit_Int: Int {
		return Int(self.dayOneDigit)!
	}
    
    
    /// Return two digit from day // 01
	public var dayTwoDigit_Int: Int {
		return Int(self.dayTwoDigit)!
	}
	
    /// Return one digit from day // 01
	public var dayOneDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "d"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return two digit from day // 02
	public var dayTwoDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd"
		return dateFormatter.string(from: self as Date)
	}
    
    
    /// Return day in short formate // Ex: Mon
	public var dayNameShort: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "E"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return day in full formate // Ex: Monday
	public var dayNameFull: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEEE"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return first letter of day // Ex: M
	public var dayNameFirstLetter: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEEEE"
		return dateFormatter.string(from: self as Date)
	}
	
	
	
	
	// MARK:- AM PM
    
    /// Return AM/PM from date
	public var AM_PM: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "a"
		return dateFormatter.string(from: self as Date)
	}
	
	// MARK:- HOUR
	
	
    /// Return Hour in one digit
	public var hourOneDigit_Int: Int {
		return Int(self.hourOneDigit)!
	}
	
    /// Return Two in two digit
    public var hourTwoDigit_Int: Int {
		return Int(self.hourTwoDigit)!
	}
    
    /// Return one digit in 24 hour
	public var hourOneDigit24Hours_Int: Int {
		return Int(self.hourOneDigit24Hours)!
	}
    
    /// Return two digit in 24 hour
	public var hourTwoDigit24Hours_Int: Int {
		return Int(self.hourTwoDigit24Hours)!
	}
    
    /// Return hour in one digit (String)
	public var hourOneDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "h"
		return dateFormatter.string(from: self as Date)
	}
    
    
    /// Return hour in two digit (String)
	public var hourTwoDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "hh"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return one digit in 24 hour (String)
	public var hourOneDigit24Hours: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "H"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return two digit in 24 hour (String)
	public var hourTwoDigit24Hours: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH"
		return dateFormatter.string(from: self as Date)
	}
	
	// MARK:- MINUTE
	
    /// Return minute in one digit (Int)
	public var minuteOneDigit_Int: Int {
		return Int(self.minuteOneDigit)!
	}
    
    /// Return minute in two digit (Int)
	public var minuteTwoDigit_Int: Int {
		return Int(self.minuteTwoDigit)!
	}
	
    /// Return minute in one digit (String)
	public var minuteOneDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "m"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return minute in two digit (String)
	public var minuteTwoDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "mm"
		return dateFormatter.string(from: self as Date)
	}
	
	
	// MARK:- SECOND
	
    /// Return second in one digit (Int)
	public var secondOneDigit_Int: Int {
		return Int(self.secondOneDigit)!
	}
    
    /// Return second in two digit (Int)
	public var secondTwoDigit_Int: Int {
		return Int(self.secondTwoDigit)!
	}
	
    /// Return second in one digit (String)
	public var secondOneDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "s"
		return dateFormatter.string(from: self as Date)
	}
    
    /// Return second in two digit (String)
	public var secondTwoDigit: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "ss"
		return dateFormatter.string(from: self as Date)
	}
	
	
}

